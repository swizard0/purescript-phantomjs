## Module Test.Phantomjs.Webpage.PaperSizeUtil

#### `Top`

``` purescript
type Top = Length
```

#### `Left`

``` purescript
type Left = Length
```

#### `Right`

``` purescript
type Right = Length
```

#### `Bottom`

``` purescript
type Bottom = Length
```

#### `Height`

``` purescript
type Height = Length
```

#### `Width`

``` purescript
type Width = Length
```

#### `PageNum`

``` purescript
type PageNum = Int
```

#### `NumPages`

``` purescript
type NumPages = Int
```

#### `Format`

``` purescript
data Format
  = A3
  | A4
  | A5
  | Legal
  | Letter
  | Tabloid
```

##### Instances
``` purescript
instance showFormat :: Show Format
```

#### `Length`

``` purescript
data Length
  = Pixels Int
  | Inches Number
  | Centimeters Number
  | Millimeters Number
```

#### `Margin`

``` purescript
data Margin
  = Margin Top Left Bottom Right
```

#### `Orientation`

``` purescript
data Orientation
  = Landscape
  | Portrait
```

##### Instances
``` purescript
instance showOrientation :: Show Orientation
```

#### `PaperDimensions`

``` purescript
data PaperDimensions
  = PaperDimensions Format Orientation
  | PaperDimensionsLxW Length Length
```

#### `PaperSize`

``` purescript
data PaperSize
  = PaperSize PaperDimensions Margin
```

#### `setPaperSize`

``` purescript
setPaperSize :: forall e. Page -> PaperSize -> Eff (phantomjs :: PHANTOMJS) Unit
```


