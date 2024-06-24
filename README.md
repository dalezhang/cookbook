# CookBook

The objective of this project is to effectively manage the ingredients within the refrigerator and, based on the quantity of ingredients you set for each dish, inform you which dishes can be prepared with the existing ingredients available.

Another purpose is to try [Stimulus](https://stimulus.hotwired.dev/) as a new feature of Rails 7.

It also used [Stimulus Reflect](https://stimulus.hotwired.dev/reference/reflect), [Tailwind CSS](https://tailwindcss.com/), [Esbuild](https://esbuild.github.io/), and [Flowbite](https://flowbite.com/). 

### Install

```
bundle install
yarn install
rails db:create db:migrate
rails s
```

### Replase ImportMap by Esbuild

Due to slow network speeds, the `ImportMap pin` fails to download packages properly, necessitating manual copying of files to the `vendor/javascript` directory. For complex dependency packages, it is necessary to check the dependency relationships and copy the related packages to the `vendor/javascript` directory as well.
This approach proves to be quite inconvenient. It would be possible to introduce JS dependencies in the form of gems; however, some gems have not been updated for a long time, making it impossible to use the latest versions.

So I used [jsbuilding](https://github.com/evilmartians/jsbuilding) and [esbuild](https://esbuild.github.io/) to replase the ImportMap.

### Flowbite

I need to use [stimulus-multiselect](https://dev.to/wizardhealth/stimulus-multiselect-4m8p) to make a multiple select dropdown menu. However, after its introduction, it was discovered that there is a conflict with the display mechanism of Flowbite's modal.
Due to their reliance on the `Stimulus Controller`, the mechanism of Modal binding the controller to pop up a popup can cause the binding of the stimulus-multiselect's controller within the Modal to become ineffective. Therefore, I need to rebind the stimulus-multiselect after the Modal triggers the popup

```js
reflexSuccess (element, reflex, noop, id) {
  // If multiselect__container didn't appear, try to re-register.
  if (!document.getElementsByClassName('multiselect__container')[0]) {
    window.Stimulus.register('multiselect', Multiselect)
  }
}
```
