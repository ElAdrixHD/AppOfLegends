import 'package:app_of_legends/src/models/full_champion_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:transparent_image/transparent_image.dart';

class SpellView extends StatelessWidget {
  final dynamic spell;
  final int index;
  SpellView(this.spell, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            CircularProgressIndicator(),
            (spell is Spell)?FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "http://ddragon.leagueoflegends.com/cdn/10.16.1/img/spell/${spell.image.full}",height: 80,):FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "http://ddragon.leagueoflegends.com/cdn/10.16.1/img/passive/${spell.image.full}",height: 80,),
          ],
        ),
        //http://ddragon.leagueoflegends.com/cdn/10.16.1/img/spell/FlashFrost.png
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text((index==0)?"P: ":(index==1)?"Q: ":(index==2)?"W: ":(index==3)?"E: ":(index==4)?"R: ": "", style: Theme.of(context).textTheme.headline6),
                    Container(alignment: Alignment.centerLeft, child: Text(spell.name, style: Theme.of(context).textTheme.headline6)),
                  ],
                ),
                (spell is Spell)? Container(alignment: Alignment.centerRight,child: Text((spell as Spell).cooldown.toString(), style: Theme.of(context).textTheme.caption,)) : Container(),
                SizedBox(height: 10,),
                Container(alignment: Alignment.centerLeft, child: Html(data: spell.description,style: {"html": Style(fontSize: FontSize.small)},),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
