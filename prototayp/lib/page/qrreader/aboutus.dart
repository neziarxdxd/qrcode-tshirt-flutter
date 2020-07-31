import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12.0, top: 8, bottom: 8),
        child: Container(
          child: ListView(
            children: [
              Text(
                "About Us",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                ''' 
            Sa totoo lang wala akong alam na pwede kong sabihin dito pero isa lang ang masasabi ko Salamat, lalo na sa mga taong naniwala sa akin personally     para magawa 'tong page na ito at mag produce ng mga bagay na hindi ko pa ginawa sa tanan ng buhay ko hmm ang drama ko no kainis naiiyak ako HAHAHAHAA (tawa ta's iiyak prang tanga amp hahaha charot).

            Pero  yun nga seriously speaking. Nagsimula ang Programmer ako dahil wala lang akong magawa at gusto ko lang mag-rant kasi feel ko bobo ako  sa grammar that time , well bobo naman talaga hahahaa pero trying my best to cope up with my weaknesses anywaaaaaaaaaaay ayun sumikat ang page daw dahil sa mga slideshows na ginagawa ko which is umaabot ng 20 slides tapos puro kalokohan ko ang mga pinagsasabi ko doon , kalokohan na may onteng inspirasyon

            AKala ko walang tatangkilik  sa mga tips na ginagawa ko and yun nga. Didn't expect that I'll make a difference to the people around me. Didn't expect that people will love the way how I think Didn't expect that I'll inspire some of the young and other old aspiring programmers. Thank you so much especially to those people who keep sharing the page. Thank you and I love you, we love you all.                    
            ''',
                style: TextStyle(fontFamily: "Poppins"),
              ),
              Text(
                '''hmmm... it's not about US, it's not about the page. It's about you who makes the page alive and active and because of you nakakagawa kami ng mga content. Maraming Salamat sa inyo''',
                style: TextStyle(
                    fontFamily: "Poppins", fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
