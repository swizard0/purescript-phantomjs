## Module Test.Phantomjs.ChildProcess

#### `ChildProcess`

``` purescript
data ChildProcess :: *
```

#### `Command`

``` purescript
type Command = String
```

#### `Arg`

``` purescript
type Arg = String
```

#### `spawn`

``` purescript
spawn :: forall e. Command -> Array Arg -> Eff (phantomjs :: PHANTOMJS | e) ChildProcess
```


