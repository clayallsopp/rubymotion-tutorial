# Hello Motion

Navigate to where you want to create your RubyMotion projects and run:

```
motion create ProvingGround
```

which creates a `ProvingGround` folder and some files inside. `cd` into it (`cd ./ProvingGround`). You'll run all of the RubyMotion commands from this location, so definitely keep a terminal window/tab open to it.

We'll talk about just two files it creates: `Rakefile` and `./app/app_delegate.rb`.

`Rakefile` is where you do your app configuation (stuff like what the app's named, what resources to include, etc) and library imports (so 3rd-party gems or other local sources). As of RubyMotion 1.11, it will look like:

```
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ProvingGround'
end
```

If you're not intimately familar with Ruby, the first thing you may think is, "Wait...`$.unshift` who?" Strange indeed. What this line does is tell Ruby, "When we use `require`s, also look in the '/Library/RubyMotion/lib' directory to find what we're requiring". 'motion/project' resides there, and without the initial `$.unshift` nothing would be found!

So we `require 'motion/project'`, which gives us proper access to RubyMotion and setting up our app in the `.setup` block. There are all sorts of available options, which as the auto-generated comment says can be listed using `rake config`. By default, RubyMotion sets the `.name` to our project's name, so that looks good.

Wait, why do we have a `Rakefile` at all? Well, RubyMotion uses `rake` for all of it's functions, and by default the `rake` command runs the `Rakefile` in the current directory.

Give it a go! Run `rake` in your terminal and you should have a blank iPhone simulator pop up. "Hooray!" you may exclaim...but how did that happen? How did we get from `app.name = 'ProvingGround'` to an iPhone popping up?

Turns out RubyMotion's App object has some sensible defaults, such as (most importantly) recursively including all Ruby files in `./app`. Remember that `app_delegate.rb` I mentioned earlier? Because of this setting, that guy got included when we compiled our app! Let's take a look:

```
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true
  end
end
```

Wait, all that did was define an `AppDelegate` class with one method. There's not even a superclass, how does this do anything?!

Run that `rake config` command real quick. It'll spit out a bunch of settings and information, but what we're interested in is this:

```
...
delegate_class         : "AppDelegate"
...
```

Whoa buddy, there's our "unimportant" AppDelegate! RubyMotion actually looks for a class with the value we assign as `delegate_class` and uses that in launching our app. We could've called our class `SuperAppDelegate` and changed our `Rakefile` as such:

```
Motion::Project::App.setup do |app|
  app.name = 'ProvingGround'
  app.delegate_class = "SuperAppDelegate"
end
```

So...what is a delegate? In iOS-land, when the user launches our app the system sets up a bunch of stuff for us. We need to give the OS an object which can respond to different events during that process, called the "application delegate". It gets callbacks for when the app starts, pauses, ends, gets a push notification, all sorts of fun stuff. 

In the template code, we only implement the `application:didFinishLaunchingWithOptions:` method. This is called when the system finishes setting up the app and becomes ready for us to do our own setup:

```
def application(application, didFinishLaunchingWithOptions:launchOptions)
  true
end
```

For now, just assume it will always return `true`. Some apps may want to use `launchOptions` to determine if the app should be started or not, but most of the time you won't do that.

COOL. Now we understand how our app boots up and have our entry point. Let's...do something?

Change your `application:didFinishLaunchingWithOptions:` to look like:

```
def application(application, didFinishLaunchingWithOptions:launchOptions)
  alert = UIAlertView.new
  alert.message = "Hello Motion!"
  alert.show

  true
end
```

See what we added? Those three lines about a `UIAlertView`? `UIAlertView`s are the blue popups you see sometimes while using iOS (logging in to the iTunes Store, pre-iOS5 push notifications, etc). We create one, give it a message, then show it.

Run `rake` again and...BAM, an unclossable blue popup! But...at least we know how it got there.


What did we learn?
  - Create RubyMotion apps with `motion create <ProjectName>`
  - Configure your app and import libraries inside `Rakefile`
  - Apps need a delegate, and RubyMotion needs you to set it's value (or use the default) in the `Rakefile`
  - App delegates use `application:didFinishLaunchingWithOptions:` as the first entry point.
  - Run your app using `rake` while inside the project directory.