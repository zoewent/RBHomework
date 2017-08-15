### Assumptions
1. Entity relationship: 
    
    `RSArtist` to `RSWork`: one to many. 
    
    `RSWork` to `RSProduct`: one to many

2. Assume products and artworks can be displayed seperately

3. Assume data model can be modified. 

    Property "isSaved" is added to all models in order to save favourites into realm.

### Extra 3rd Party Library
Nimble is a library help with efficient and readable unit testing. It allows to express expectations using a natural, easily understood language. As how to use XCTest is not a key point of this test, I decided to use nimble for unit test to save development time.

### Features
1. Products and artworks are displayed in two seperated collection views for the consideration of user experience. Mix products and artworks may cause confusion since products are generated with an artwork based on some templetes, such as a poster templete, or a mug (my understanding). 

    Product and artwork collections can be switched by swiping left or right, also can scroll up and down to check all items.

2. Segmented control can filter products and artworks as All, favourited and not favourited.

3. Tap on items in Product collection, navigate to product details page. User can favourite/ unfavourite an item by click the heart button.

4. On product detail screen, related artwork is displayed and can be tapped to navigate to see the artwork details.

5. Tap on items in Artwork collection, navigate to artwork details page. User can favourite/ unfavourite an item by click the heart button.

### Architecture
The architecture has been designed to seperate responsibilities and increase reusability, also to save time on fixing bugs for human mistakes.

#### Helpers
`RealmManager`: handle initialisation and configuration for Realm, also provides easy access to realm with `RealmManager.shared.realm`.

`ImageDownloader`: Since the app requires a lot of image downloading tasks, `ImageDownloader` handles asynchronous image downloading.

`ImageCache`: Checks if images has been presiously downloaded and cached based on image url. If not, `ImageCache` will call `ImageDownloader` to download the image and save in cache.

#### UI Helpers

`UIStoryboardExtension` and `UINibExtension` extend `UIStoryboard` and `UINib`, to provide easy access to storyboards and nib with their class names as the unique identifier, helps avoid common mistakes with the identifiers and storyboard / nib names.

`UIImageView+Style` provides globalised styles on UIImageView, also avoid code repeat.

`UIImageView+Networking` borrows idea from image downloading libraries, along with `ImageDownloader` and `ImageCache`, `UIImageView` gets the capability to download, cache and set its own image.

#### View Controller Data Handling

`GridPageViewController` contains two `GridCollectionViewController` instances in it. `GridCollectionViewDataSource` handles data for `GridCollectionViewController`.

### Known Issue
1. Segmented control status cannot be stored or reset when swipe left or right.

2. Search functionality is not implemented as the time limits.

### What can be improved

1. Richer infomation can be displayed, such as astist info page, which can list some work of the artist.
2. Recommandation of more items that user may like.


