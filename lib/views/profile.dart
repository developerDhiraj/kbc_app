import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white,),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined), color: Colors.white,),
          IconButton(onPressed: (){}, icon: Icon(Icons.person_add), color: Colors.white,),],
        title: Text("Profile", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
      centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
        
              height: 310,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1543357530-d91dab30fa97?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), radius: 60,),
                      
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.edit_outlined, color: Colors.purple,),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Phul Kumari", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500), ),
                  SizedBox(height: 20,),
                  Divider(thickness: 1,indent: 20,endIndent: 20,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("45", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 40, color: Colors.white.withAlpha(180)),),
                          Text("Level", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19, color: Colors.white),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("#335", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 40, color: Colors.white.withAlpha(180)),),
                          Text("Rank",  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19, color: Colors.white),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("LeaderBoard ", style: TextStyle(fontSize: 20, ),),
        
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 280,
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1722270608841-35d7372a2e85?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", ),),
                            SizedBox(width: 10,),
                            Text("Phul Kumari"),
                          ],
                        ),
                        leading: Text("#${index+1}", style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Text("Rs.${(2000000/(index+1)).toString().substring(0,6)}", style: TextStyle(fontWeight: FontWeight.bold),),
                      );
                    },
                    separatorBuilder: (context,index) => Divider(thickness: 1,color: Colors.purple,indent: 10,endIndent: 10,),
                    itemCount: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
