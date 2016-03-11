+++
date = "2016-03-11T16:19:57+01:00"
description = ""
tags = ["java", "junit","testing"]
title = "Exceptions in Tests"
topic = ["software development","testing"]

+++

What I often encounter in tests is something like:

    public void testMethod() {
      try {
        someTestCode(); 
      catch(SomeException e) {
        fail(e.getMessage)
      }
    }

This is unnecessary as JUnit and other test frameworks will fail a test if an exception is thrown. So declare the test method to throw SomeException.

Another often encountered snippet is:

    public void testMethod() {
      try {
        someTestCode();
        fail("SomeException expected")
      catch(SomeException e) {
        // all ok
      }
    }
	

This was an idiom in JUnit3 to test that an exception is thrown. In times of JUnit4 the idiom changed to:

    @Test(expected=SomeException.class)
    public void testMethod() {
      someTestCode();
    }

This automatically fails the test method if the exception is not thrown and in my opinion is slightly more readable than the example before. On the other hand if you need to test message or other properties of the exception you still have to use the JUnit3 idiom. But if you’re just interested that an exception is thrown one can use the new syntax.
