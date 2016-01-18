Having looked at the test framework from [Aimee Rivers](https://github.com/sermoa), it looks like it wouldn't be such a streach to make a fully fledged testing framework.
+ I can easily add a should object to Object which would be a catch all for assertions. This will make test code look a lot like natural language. 
+ Might be able to use the operator functionality to further the cause of natural language. Ie "thing should equal otherThing" instead of "thing should equal(otherThing)"
+ I can bootstrap the test framework if I allow it to take a script name as well as auto importing "*.test.io". That way I can, for example, have shouldFail.io and chack that it fails with a script.
