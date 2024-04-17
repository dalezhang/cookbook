# README

本项目使用了[Stimulus](https://stimulus.hotwired.dev/)、[Stimulus Reflect](https://stimulus.hotwired.dev/reference/reflect)、[Tailwind CSS](https://tailwindcss.com/)、
[Esbuild](https://esbuild.github.io/)、[Flowbite](https://flowbite.com/) 等框架，搭建了一个保存食材和根据菜谱列出可选菜品的网站。

在开发过程中遇到了一些问题：

### ImportMap

因为网络慢，导致ImportMap pin无法正常下载包，需要手动复制文件到`vendor/javascript`目录下。对于依赖情况复杂的包，因为需要检查依赖关系并复制相关的包到`vendor/javascript`目录下。
导致这种用法十分不方便。当然可以让 js 依赖以 gem 的方式引入，但是因为有的 gem 许久未更新，导致没法使用最新的版本。

作为替代我用[jsbuilding](https://github.com/evilmartians/jsbuilding)和[esbuild](https://esbuild.github.io/)来替换掉了ImportMap。

### Flowbite

我需要引入[stimulus-multiselect](https://dev.to/wizardhealth/stimulus-multiselect-4m8p)来做一个多选框，但是在引入后发现他会与Flowbite 的 modal在显示机制上有冲突
，因为它们都依赖Stimulus Controller, Modal通过绑定controller来弹出popup 的机制会导致在 Modal 内部stimulus-multiselect的绑定controller失效。于是我需要在Modal触发 popup 后
重新绑定stimulus-multiselect。

```js
reflexSuccess (element, reflex, noop, id) {
  // 多选框没出来时重新注册
  if (!document.getElementsByClassName('multiselect__container')[0]) {
    window.Stimulus.register('multiselect', Multiselect)
  }
}
```
