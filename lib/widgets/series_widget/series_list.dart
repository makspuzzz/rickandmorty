import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/series_models.dart';
import 'package:rickandmorty/pages/series_page/info_series.dart';

class SeriaWidget extends StatelessWidget {
  const SeriaWidget({
    Key? key,
    required this.listEpisodes,required this.index,
  }) : super(key: key);

  final List<dynamic> listEpisodes;
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 40, top: 8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(61, 62, 67, 1),
          border: Border.all(
              color: Colors.black.withOpacity(0.2)),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 6, bottom: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment
                    .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 82),
                    child: Text(listEpisodes[index].name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(listEpisodes[index].airDate,
                    style: const TextStyle(
                      color: Color.fromRGBO(
                          146, 150, 155, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),

                  ),
                ],
              ),
            ),
            Positioned(
                right: 9,
                top: 7,
                child: Text(listEpisodes[index].episode,
                  style: const TextStyle(
                    color: Color.fromRGBO(146, 150, 155, 1),
                    fontWeight: FontWeight.w900,
                  ),
                )),
            Positioned(child:
              Container(
                height: 52,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => InfoSeriesPageWidget(serie: listEpisodes, index: index,)));
                    },
                  ),
                ),
              )
            )
          ],
        )
    );
  }
}