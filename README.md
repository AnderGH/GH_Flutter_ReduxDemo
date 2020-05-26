
> `Redux`是一种状态容器，提供一种状态管理的机制。在`React-Native`和`Flutter`中，都有对应的集成方法。

> 在`Flutter`中，官方提供了基础的状态管理的控件`InheritedWidget`，所以本质上`flutter_redux`只是对`InheritedWidget`的封装

#### 一、集成

`pubspec.yaml`中引入需要引入对应的插件包，具体最新的版本，需要在[官方网站](https://pub.dev/)站查询

```
dependencies:
  flutter:
    sdk: flutter

  redux: ^4.0.0
  flutter_redux: ^0.6.0
  redux_thunk: ^0.3.0
```

调用`flutter packages get`命令加载插件

#### 二、简单介绍

- `Store`
- `Reducer`
- `State`

1. `Store`负责保存各种方法和属性的实例，其中主要参数`reducer`、`initialState`和`middleware`

2. 其中`reducer`是绑定数据和操作的类，包含两个属性，`state`和`action`，需要在`reducer`中判断每个`action`具体对应到什么参数操作

3. `Store`实例创建完成后，需要加入到`widgets`树中去，需要使用`StoreProvider`类，`Store`实例必须要加入到`widgets`树的最顶层，所以，`StoreProvider`要比整个`APP`的入口`MaterialApp`更高，仅次于`runApp`的方法

4. 在任意一层`widget`中使用快捷的`of`方法，即可从`context`中获取到`Store`实例对象

5. `redux_thunk`插件提供从接口请求数据的绑定操作，将`thunkMiddleware`值传入`Store`的`middleware`参数，通过`store.dispatch`方法可以调用绑定的数据请求的方法，数据请求的方法需要有返回值类型`ThunkAction<State>`，此类型为定义的别名，
```
typedef dynamic ThunkAction<State>(Store<State> store);
```
所以直接`Store`对象，并在方法中实现具体的请求参数等逻辑

6. `dispatch`触发数据请求后，还需要继续执行`dispatch`操作，继续触发`action`，通过判断`action`类型来执行具体的数据保存操作，全部执行完成后，数据会保存在`State`中，此时`redux`会触发数据变化的通知，重构`StoreConnector`中`builder`的实现


#### 三、示例代码

[`https://github.com/AnderGH/flutter_redux_demo/blob/master/demo_redux/lib/main.dart`](https://github.com/AnderGH/flutter_redux_demo/blob/master/demo_redux/lib/main.dart)

