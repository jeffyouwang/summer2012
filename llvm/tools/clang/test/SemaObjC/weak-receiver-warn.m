// RUN: %clang_cc1 -fsyntax-only -fobjc-runtime-has-weak -fobjc-arc -fblocks -Wreceiver-is-weak -verify %s
// rdar://10225276

@interface Test0
- (void) setBlock: (void(^)(void)) block;
- (void) addBlock: (void(^)(void)) block;
- (void) actNow;
@end

void test0(Test0 *x) {
  __weak Test0 *weakx = x;
  [x addBlock: ^{ [weakx actNow]; }]; // expected-warning {{weak receiver may be unpredictably null in ARC mode}}
  [x setBlock: ^{ [weakx actNow]; }]; // expected-warning {{weak receiver may be unpredictably null in ARC mode}}
  x.block = ^{ [weakx actNow]; }; // expected-warning {{weak receiver may be unpredictably null in ARC mode}}

  [weakx addBlock: ^{ [x actNow]; }]; // expected-warning {{weak receiver may be unpredictably null in ARC mode}}
  [weakx setBlock: ^{ [x actNow]; }]; // expected-warning {{weak receiver may be unpredictably null in ARC mode}}
  weakx.block = ^{ [x actNow]; };
}

@interface Test
{
  __weak Test* weak_prop;
}
- (void) Meth;
@property  __weak Test* weak_prop; // expected-note {{property declared here}}
@property (weak, atomic) id weak_atomic_prop; // expected-note {{property declared here}}
- (__weak id) P; // expected-note {{method 'P' declared here}}
@end

@implementation Test
- (void) Meth {
    if (self.weak_prop) {
      self.weak_prop = 0;
    }
    if (self.weak_atomic_prop) {
      self.weak_atomic_prop = 0;
    }
    [self.weak_prop Meth]; // expected-warning {{weak property may be unpredictably null in ARC mode}}
    id pi = self.P;

    [self.weak_atomic_prop Meth];  // expected-warning {{weak property may be unpredictably null in ARC mode}}

    [self.P Meth];		   // expected-warning {{weak implicit property may be unpredictably null in ARC mode}}
}

- (__weak id) P { return 0; }
@dynamic weak_prop, weak_atomic_prop;
@end

