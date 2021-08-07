# Let's Build the application

## Getting Started

> Starting with Flutter

1. Install Flutter using instruction on flutter.dev
2. Install either VS Code or IntelliJ or Android Studio
3. Create a new project and Run the starter app!
4. Fork or Download this Repo and open the covid_data_started folder
5. We are good to go. Follow along on the workshop.

> ### Tasks
 
#### 1. Adding Buttons for the all 6 Continents.
   1. Option 1: Just Copy-Paste the 'Asia' button and change the names.
   2. Option 2: Use a for loop and iterate over the list.
      > `for(int i  = 0; i < _list.length; i++) DataNameButton(name: _list[i])` 
   3. Option 3 _(A bit advanced)_: Map each elements of the list to genarate a list of Widgets on fly
      > `_list.map((e) => DataNameButton(name: e)).toList()`
   4. Option 4 **(Try Yourself)**: Implement a List View
#### 2. Write function for Fetching Data from API
   1. Step 1: Add http Package
   2. Step 2: Write Asynchronous function to fetch data from the server in api.dart file
      > `getContinentData(String continent) async {
          http.Response data = await http.get(Uri.parse('https://corona.lmao.ninja/v2/continents/$continent'),); 
          print(data.body);
          return jsonDecode(data.body);
      }`
#### 3. Navigate to next Page
   * Use navigator to navigate to next page:
     > `Navigator.push(
        context,
   MaterialPageRoute(
   builder: (context) => CovidDataPage(
   name: name,
   )));`
   
#### 4. Implementing Future Builder
   1. Wrap the already implemented UI with FutureBuilder
   2. Add the function `getContinentData(String Continent)` as the future as it returns a Future Object
   3. Add the already built UI inside the builder function.
   4. Check what the snapshot contains and render the UI accordingly
      1. Basically check if data received is null or not
      2. If its null add a progress indicator to avoid null pointer exception

#### 5. Add GridView to display Data
* We will use GridView to Implement the data display screen
    > `GridView.count(
crossAxisCount: 2,
childAspectRatio: 2.5,
shrinkWrap: true,
children: [
],
)`

#### 6. Implement a DataCard and Add it to GridView
1. Implement a Card inside the DataCard Class
    >`Card(
   color: color,
   child: Padding(
   padding: const EdgeInsets.all(8.0),
   child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
   mainAxisSize: MainAxisSize.min,
   children: [
   Text(
   dataLabel,
   style: TextStyle(
   fontSize: 16,
   fontWeight: FontWeight.bold,
   ),
   ),
   Text(
   data,
   style: TextStyle(
   fontSize: 32,
   fontWeight: FontWeight.w900,
   ),
   )
   ],
   ),
   ),
   )`
2. Add the implemented DataCard inside the GridView
    > `DataCard(
   dataLabel: 'Total Cases',
   data: args['cases'].toString(),
   ),`
    



