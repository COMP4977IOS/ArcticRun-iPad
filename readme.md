# Arctic Run - iPad
Arctic Run is a fitness game for iOS. Developed by Students at BCIT.

## Merging

### Project Files
To merge Xcode project files (pbxproj):
- Install mergepbx, Either using the install script [here](https://github.com/simonwagner/mergepbx) or with homebrew:

  ```
  brew install mergepbx
  ```
- Configure your global git config so it's aware of the tool

  ```
  #driver for merging Xcode project files
  [merge "mergepbx"]
  name = Xcode project files merger
  driver = mergepbx %O %A %B
  ```
- This repo is already configured to use mergepbx using the `.gitattributes`

### Storyboards
At the moment, the best way to "merge" storyboards is to avoid conflicts by using references. [Here's a tutorial on storyboard references](http://code.tutsplus.com/tutorials/ios-9-staying-organized-with-storyboard-references--cms-24226).
