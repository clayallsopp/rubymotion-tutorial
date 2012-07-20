---
layout: default
title: In Motion
---
# Prologue: In Motion

## In The Beginning

iOS development has remained fundamentally unchanged over the past five years, yet the amount and variation of products created for the platform has increased expontentially. There have been welcome improvements to the Objective-C language (blocks, ARC, literals), but it's clear that Apple intends to stick with it for the long haul.

That's not a bad thing at all. Objective-C really is great for what it tries to be: a dynamic, object-oriented superset of C. It will do compile-time type-checking while providing an introspective runtime with which you can do some really magical things.

But even for all its strengths, many programmers balk at the prospect of learning a niche and odd-looking language just to make iOS software. Instead, they turn to familiar yet non-native technologies like HTML5, which ultimately produce a substandard user experience. Wouldn't it be wonderful if there was a more accessible language with which we could write native, performant iOS apps? *dun dun dun*

## And Then There Was Motion

[RubyMotion][motion] is such a solution. It allows you to write iOS apps in [Ruby][ruby] with no penalty to user experience. And it preserves the iOS SDK syntax as intended by Apple, so all exisiting code examples and tutorials are perfectly translateable.

How does that work? Well, technically it's a *variant* of Ruby; you can't use some of Ruby's extremely dynamic methods like `eval` or `define_method`, and it adds some new features like `functions.with(some, named: parameters). This allows your Ruby code to be compiled to machine code that is identical to compiled Objective-C; in other words, the device can't tell the difference between RubyMotion and normal iOS apps.

If you just don't like Ruby, RubyMotion won't change your mind. But if you aren't anti-Ruby, or you're just a developer who wants to write apps in a language farther away from the metal, I highly recommend you give RubyMotion a chance.

[Head to the first chapter and get started!](/1-hello-motion)

[motion]: http://rubymotion.com

[ruby]: http://www.ruby-lang.org/en/