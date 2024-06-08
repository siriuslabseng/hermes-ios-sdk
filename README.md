Hermes iOS SDK

The Hermes Android SDK allows you display your changelogs easily in your android app. Get started here - [Hermes](https://tryhermes.app) 

[![Platform](/platform.svg)]()
[![](https://jitpack.io/v/siriuslabseng/hermes-android-sdk.svg)](https://jitpack.io/#siriuslabseng/hermes-android-sdk)
<br><br>

<p float="left">
  <img src="/ytscreens/1.png" width="48%" />
  <img src="/ytscreens/2.png" width="48%" />
</p>



## 🚀 Getting Started

Add to your root build.gradle, the JitPack Repository

```
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        mavenCentral()
        maven { url 'https://jitpack.io' }
    }
}
```

Add to your project build.gradle file, the Nomba Android SDK

```
implementation("com.github.siriuslabseng:hermes-android-sdk:v1.0.0")
```
<br>



## 📖 Documentation

All of your interactions with the Hermes SDK is through a singleton, the HermesManager.
Initialise it as early as you can passing the activity that would display the Changelogs (for Context), your Hermes public key and the widget slug (you can get this values from your Hermes Dashboard)
and the main ViewGroup which would house the HermesManager UI. The ViewGroup should be a constraintLayout or extend from it.

```
val hermesManager = HermesManager.getInstance(activity, "widgetslug", 
"hermes-public-key", viewGroup)
```

NombaManager handles it's own back stack, managing views and UI when it's presented and the back button or back gesture is
triggered. You need to include in your application's onbackpressed callback, NombaManager's backstack handler. An example below

```
 val callback: OnBackPressedCallback = object : OnBackPressedCallback(true) {
        override fun handleOnBackPressed() {
            // call this in your backstack management handling code,
            // to enable the back button response to Wraith's DisplayStates
            hermesManager.handleBackStack()
        }
}
onBackPressedDispatcher.addCallback(callback)
```

When you are ready to show your changelog, simple present the changelog view

```
// show the SDK when you want to display your changelog
button.setOnClickListener {
    hermesManager.showChangelogView()
}
```
<br>



## 📱 Projects

If you use the Hermes Android SDK in your project and would like it listed here, simply create a new issue with the title of your app, link to it on the PlayStore and tag it
with the label 'project'. It would get added here afterwards.

<br>



## 👨‍💻 Contributing

Pull requests with bugfixes and new features are much appreciated. We'll be happy to review them and merge them once they're ready, as long as they contain change that provides generally useful functionality.

Clone the repository to get started working on the project.

```bash
git clone https://github.com/siriuslabseng/hermes-android-sdk
```
<br>



## ❤️ Acknowledgments

- [Markwon](https://noties.io/Markwon/#supported-markdown-features) is used to parse markdown.
- [Retrofit](https://github.com/square/retrofit) is used for network request management.
