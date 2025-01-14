import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:artistry_app/CatPaintings/painting1.dart';

class Photography extends StatelessWidget {
  Photography({super.key});
  final List<Map<String, dynamic>> paintinglist = [
    {'image': 'images/catPhotography/pho1.jpg', 'name': '" Scooter "', 'price' : '\$4,000','page': Product1()},
    {'image': 'images/catPhotography/pho2.jpg', 'name': '" Historic "', 'price' : '\$3,500','page': Product1()},
    {'image': 'images/catPhotography/pho3.jpg', 'name': '" Lady with a Basket "', 'price' : '\$1,400','page': Product1()},
    {'image': 'images/catPhotography/pho4.jpg', 'name': '" Afternoon Talk "', 'price' : '\$12,400','page': Product1()},
    {'image': 'images/catPhotography/pho5.jpg', 'name': '" Emma "', 'price' : '\$5,600','page': Product1()},
    {'image': 'images/catPhotography/pho6.jpg', 'name': '" Bliss "', 'price' : '\$3,200','page': Product1()},
    
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title:Text('Photography'),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                   mainAxisSpacing: 12.h,
                    childAspectRatio: 0.65,
                ),
                itemCount: paintinglist.length,
                 itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => paintinglist[index]['page'],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(8.r),
                        color: Colors.white,
                        border: Border.all(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: Offset(0,2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  paintinglist[index]['image'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text( paintinglist[index]['name'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  Text(
                                    paintinglist[index]['price'],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey[800],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  );
                 }
                ),
              )
          ],
        ),
      )

    );
  }
}