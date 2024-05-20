import 'package:app_cuoiki/models/models.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';




class Item extends StatelessWidget {
  const Item(
    this.model, {
    super.key,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onDelete;
  final Model model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0).copyWith(right: 6.0),
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.orange, width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: const [
          BoxShadow(
            color: AppColor.black,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 7.0,),

          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Image.asset(
              model.imageStr ?? '',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10.0,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  model.name ?? '-:-',
                  style: const TextStyle(
                      color: AppColor.brown,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 4.0),

                Text(
                  model.description ?? '-:-',
                  style: const TextStyle(color: AppColor.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      
                      //width: 42.0,
                      child:  ElevatedButton(
                        onPressed: (){}, 
                        child: const Text(
                          '🥰',
                          style: TextStyle(fontSize: 13.0,
                            //backgroundColor: Color.fromARGB(223, 255, 245, 245),
                            color: AppColor.red)
                        ))
                      
                    ),
                    
                    SizedBox(
                      width: 42.0,
                      child: TextButton(
                        onPressed: onRemove,
                        child: const Icon(Icons.save)
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: onDelete,
                      behavior: HitTestBehavior.translucent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundColor: AppColor.grey.withOpacity(0.8),
                          radius: 12.6,
                          child: const Icon(Icons.delete,
                              size: 14.0, color: AppColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
