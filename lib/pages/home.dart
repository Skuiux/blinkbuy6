import 'package:blinkbuy6/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_supports.dart';
import 'details.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  bool burger = false;
  bool icecream = false;
  bool pizza = false;
  bool salad = false;

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {

    });
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream, builder: (context, AsyncSnapshot snapshot) {
      return snapshot.hasData ? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    Details(detail: '', image: '', name: '', price: '',)),);
              },

              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(

                            ds["Image"], height: 160,
                            width: 160,
                            fit: BoxFit.cover,)),
                      Text(ds["Name"], style: AppWidget
                          .semiBoldTextFieldStyle()),
                      const SizedBox(height: 5.0,),
                      Text("Fresh And Healthy", style: AppWidget
                          .LightTextFieldStyle()),
                      const SizedBox(height: 5.0,),
                      Text("\$" + ds["Price"], style: AppWidget
                          .semiBoldTextFieldStyle(),)
                    ],
                  ),
                ),
              ),
            );
          }) :
      const CircularProgressIndicator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello Sumit,", style: AppWidget.boldTextFieldStyle()),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Icon(
                        Icons.shopping_cart_outlined, color: Colors.white),
                  )
                ],
              ),

              const SizedBox(height: 5.0),
              Text("Delicious Food", style: AppWidget.HeadlineTextFieldStyle()),
              Text("Discover and Get Great Food",
                  style: AppWidget.LightTextFieldStyle()),
              const SizedBox(height: 5.0),
              Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: showItem()),
              const SizedBox(
                height: 15.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            Details(
                              detail: '', image: '', name: '', price: '',)),);
                      },

                      child: Material(
                        elevation: 20.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/burger2.jpg", height: 160,
                                width: 160,
                                fit: BoxFit.cover,),
                              Text("Vegan Burger Special",
                                  style: AppWidget.semiBoldTextFieldStyle()),
                              const SizedBox(height: 5.0,),
                              Text("Fresh And Healthy",
                                  style: AppWidget.LightTextFieldStyle()),
                              const SizedBox(height: 5.0,),
                              Text("\$55",
                                style: AppWidget.semiBoldTextFieldStyle(),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20.0,),
                    // Added space between food items

                    Material(
                      elevation: 20.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/salad2.jpg", height: 160,
                                width: 160,
                                fit: BoxFit.cover),
                            Text("Vegan Salad Special",
                                style: AppWidget.semiBoldTextFieldStyle()),
                            const SizedBox(height: 5.0,),
                            Text("Fresh And Healthy",
                                style: AppWidget.LightTextFieldStyle()),
                            const SizedBox(height: 5.0,),
                            Text("\$25",
                              style: AppWidget.semiBoldTextFieldStyle(),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0,),
              Material(borderRadius: BorderRadius.circular(10),
                elevation: 10.0,

                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(

                        padding: const EdgeInsets.all(5),

                        child: Image.asset("images/salad2.jpg", height: 90,
                          width: 130,
                          fit: BoxFit.cover,)),
                    const SizedBox(width: 15.0,),
                    SizedBox(
                        height: 250,
                        child: allItemsVertically()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        foodItem("images/burger.jpg", "burger"),
        foodItem("images/icecream.jpg", "icecream"),
        foodItem("images/pizza.jpg", "pizza"),
        foodItem("images/salad.jpg", "salad"),
      ],
    );
  }

  Widget foodItem(String imagePath, String foodType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          burger = foodType == "burger";
          icecream = foodType == "icecream";
          pizza = foodType == "pizza";
          salad = foodType == "salad";
        });
      },
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              color: (burger && foodType == "burger") ||
                  (icecream && foodType == "icecream") ||
                  (pizza && foodType == "pizza") ||
                  (salad && foodType == "salad") ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(9)
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
              imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              color: (burger && foodType == "burger") ||
                  (icecream && foodType == "icecream") ||
                  (pizza && foodType == "pizza") ||
                  (salad && foodType == "salad") ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}
