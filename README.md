JSONUtilities
=============

Many 3rd party libraries, such as Facebook's iOS SDK and Amazon's iOS SDK include their own JSON libraries. This means that if you link against more than one which itself links againt the same library, then you will likely get linker errors.

Instead, it is much better for library code to use JSON utility funcitons which invoke the suitable JSON serialization methods on whichever libraries are available. This is the approach used by AFNetworking.

This repository moves these JSON utility functions to their own repo.