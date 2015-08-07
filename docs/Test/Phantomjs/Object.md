## Module Test.Phantomjs.Object

#### `Cookie`

``` purescript
newtype Cookie r
  = Cookie { name :: String, value :: String, domain :: String | r }
```

#### `Version`

``` purescript
type Version = { major :: Int, minor :: Int, patch :: Int }
```

#### `addCookie`

``` purescript
addCookie :: forall e r. Cookie r -> Eff (phantomjs :: PHANTOMJS | e) Boolean
```

#### `clearCookies`

``` purescript
clearCookies :: forall e r. Eff (phantomjs :: PHANTOMJS | e) Unit
```

#### `getCookies`

``` purescript
getCookies :: forall e r. Eff (phantomjs :: PHANTOMJS | e) (Array (Cookie r))
```

#### `setCookies`

``` purescript
setCookies :: forall e r. Cookie r -> Eff (phantomjs :: PHANTOMJS | e) Unit
```

#### `getCookiesEnabled`

``` purescript
getCookiesEnabled :: forall e. Eff (phantomjs :: PHANTOMJS | e) Boolean
```

#### `setCookiesEnabled`

``` purescript
setCookiesEnabled :: forall e. Boolean -> Eff (phantomjs :: PHANTOMJS | e) Unit
```

#### `deleteCookie`

``` purescript
deleteCookie :: forall e r. String -> Eff (phantomjs :: PHANTOMJS | e) Boolean
```

#### `exit`

``` purescript
exit :: forall e. Int -> Eff (phantomjs :: PHANTOMJS | e) Unit
```

#### `version`

``` purescript
version :: forall e. Eff (phantomjs :: PHANTOMJS | e) Version
```


