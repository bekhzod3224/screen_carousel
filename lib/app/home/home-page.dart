
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<Map<String , dynamic>> data = [
  {
    "image": "assets/flutter_logo_01.png",
    "name": "flutter_logo_01",
    "description": "Flutter logo 1"
  },
  {
    "image": "assets/flutter_logo_02.png",
    "name": "flutter_logo_02",
    "description": "Flutter logo 2"
  },
  {
    "image": "assets/flutter_logo_03.png",
    "name": "flutter_logo_03",
    "description": "Flutter logo 3"
  }
];
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen with Carousel'),
      ),
      body: Column(
        children: [
          Spacer(flex: 2),
          SizedBox(
            height: 500,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  
                });
                _selected = value;
              },
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Center(
                  child: HomeApp(
                    image: data[index]['image'],
                    name: data[index]['name'],
                    description: data[index]['description']
                    ),
                );
              }
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.length, (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AnimatedData(isActive: _selected == index),
            )),
          ),
          
          Spacer(flex: 2,),
          ElevatedButton(onPressed: (){}, child: Text("Get Started".toUpperCase() )),
          Spacer()
        ],
      ),
    );
  }
}

class AnimatedData extends StatelessWidget {
  const AnimatedData({
    super.key, required this.isActive,
    
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 6,
    width: isActive ? 20 : 6,
    decoration: BoxDecoration(
      color: isActive ? Colors.green : Colors.grey,
      borderRadius: BorderRadius.circular(12)
    ),
    );  
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({
    super.key, required this.image, required this.name, required this.description,
    
  });

  final String image ,name, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          Expanded(child: AspectRatio(aspectRatio: 1,child: Image.asset(image),)),
          SizedBox(height: 16,),
          Text(name,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text(description, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
      ],
    );
  }
}