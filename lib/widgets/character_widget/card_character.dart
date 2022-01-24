import 'package:flutter/material.dart';
import 'package:rickandmorty/pages/characters_page/info_characters.dart';
import 'package:rickandmorty/styles/text_styles.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    Key? key,required this.characters,required this.index,
  }) : super(key: key);
  final characters;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(61,62,67,1),
              border: Border.all(color: Colors.black.withOpacity(0.2)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Image.network(characters[index].image),
                const SizedBox(width: 8,),
                Expanded(
                  child: Stack(
                    children:
                    [
                      Positioned(child:Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Last known location:",
                              style: TextStyle(
                                  fontWeight:FontWeight.w500,
                                  color:Colors.grey,
                                  fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                            const SizedBox(height: 4,),
                            Text(characters[index].location.name,
                              style: lastTextListStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                        bottom: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8,),
                          Text(characters[index].name,
                            style: titleListStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: characters[index].status=="Alive"?Colors.green:Colors.grey,
                                    borderRadius: const BorderRadius.all(Radius.circular(100))
                                ),
                                width: 10,
                                height: 10,
                              ),
                              const SizedBox(width: 5,),
                              Text(characters[index].status,
                                style: lastTextListStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,),
                              const SizedBox(width: 10,),
                              Text(characters[index].species,
                                style: lastTextListStyle,
                                maxLines: 1,
                                overflow: TextOverflow.clip,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15,),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoCharactersWidget(characters: characters[index],)));
              },
            ),
          )],
      ),
    );
  }
}