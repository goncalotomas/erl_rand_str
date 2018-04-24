# rand_str
[![Build Status](https://travis-ci.org/ClicaAi/rand_str.svg?branch=master)](https://travis-ci.org/ClicaAi/rand_str)
[![hex version](https://img.shields.io/hexpm/v/rand_str.svg)](https://hex.pm/packages/rand_str)  


An OTP library for generating random strings from whitelisted character lists.

## Why?
Reusability. You shouldn't really need to write this code every time it's needed.

## Callbacks

- get/1: returns a random list of the specified length. Returns base64 compatible characters.
- get/2: same as get/1, but uses a custom alphabet for generating the characters.

Use
-----
```
append this to the deps list in your rebar.config file

{deps, [
    ... other deps
    {rand_str, "~>1.0"}
]}.
```
