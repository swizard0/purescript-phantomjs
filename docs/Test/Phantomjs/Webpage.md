## Module Test.Phantomjs.Webpage

#### `BrowserProc`

``` purescript
data BrowserProc :: * -> *
```

Represents a NON-closure procedure that will be run in the
browser environment.


#### `Page`

``` purescript
data Page :: *
```

An instance of Phantom's `webpage`.


#### `Rect`

``` purescript
newtype Rect
  = Rect { top :: Int, left :: Int, width :: Int, height :: Int }
```

Rectangular area of the web page to be rasterized when rendered.


#### `create`

``` purescript
create :: forall e. Eff (phantomjs :: PHANTOMJS | e) Page
```

Creates an instance of Phantom's `webpage`.


#### `evaluate0`

``` purescript
evaluate0 :: forall e a. Page -> BrowserProc a -> Eff (phantomjs :: PHANTOMJS | e) a
```

Run a NON-closure procedure in the browser
environment. `evaluateN` takes N arguments. Arguments must be
JSON-serializable.


#### `open`

``` purescript
open :: forall e. Page -> String -> Aff (phantomjs :: PHANTOMJS | e) Unit
```

Opens a connection to the given URL.


#### `openWithTimeout`

``` purescript
openWithTimeout :: forall e. Page -> String -> Timeout -> Aff (avar :: AVAR, phantomjs :: PHANTOMJS | e) Unit
```

Opens a connection to the given URL, but may fail with a timeout.


#### `render`

``` purescript
render :: forall e. Page -> File -> Eff (phantomjs :: PHANTOMJS | e) Unit
```

Renders the page image to a file. File extension determines
format. Accepts: PNG, GIF, JPEG, PDF.


#### `setClipRect`

``` purescript
setClipRect :: forall e. Page -> Rect -> Eff (phantomjs :: PHANTOMJS | e) Unit
```

Sets the rectangular area of the web page to be rasterized when rendered.



