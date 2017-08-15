### Assumptions
1. Entity relationship: 
    Artist to Artwork: One to many
    Artwork to Product: One to many
2. Assume products and artworks should be displayed seperately
3. Assume data model can be modified
    Property "isSaved" is added to all models in order to save favourites into realm.

### Extra 3rd Party Library
Nimble is a library help to do unit testing in an efficient and readable way. It allows to express expectations using a natural, easily understood language. As how to use XCTest is not a key point of this test, I decided to use nimble for unit test to save development time.

### Features
1. Products and artworks are displayed in two seperated collection views, based on the consider of user experience. Mix products and artworks may cause confusion since products are generated with an artwork based on some templetes, such as a poster templete, or a mug (my understanding), 



This is not a fo


### Thoughts about architecture
The architecture has been designed to seperate responsibilities and increase reusability, also to save time on human mistakes.

### 

### What can be improved

1. Segmented control selected 
1. Richer infomation can be displayed, such as astist info page, which can list some work of the artist.
2. 



**UserInterface**

