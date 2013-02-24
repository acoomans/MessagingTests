MessagingTests
==============

Tests (ab)using of the Objective-C runtime by playing around with method implementation:

- replace a method implementation by another
- replace a method implementation by another, calling the original method
- replace the superclass's method implementation

I wouldn't recommend this in real-life implementation but may be useful for tricky hacks; i.e. when static library implementation details are not available.