import 'package:flutter/material.dart';

import '../../config/Color_style.dart';
import '../../config/Text_Style.dart';
import '../../config/size_phone.dart';

class semsem extends StatelessWidget {
  const semsem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size_phone().init(context);
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size_phone.width,
                height: size_phone.defualtsize!*20,
                child: Image.asset("images/semsem 2.jpg",fit: BoxFit.fill,),
              ),
              Center(child: Text("مشروع معصرة زيت السمسم",style:Text_Style().StyleFount(size: 25, fountFamily: 'body', color: colormarket))),
              SizedBox(height: 50,),
              Text("اولاً : التعريف بالمشروع:",style:Text_Style().content(colormarket)) ,
              SizedBox(height: 30,),
              Container(
                width: size_phone.width!*.7,
                child: Wrap(children: [
                  Text("يقوم مشروع معصرة زيت السمسم علي إنشاء معامل لإستخلاص زيت السمسم وقد كان هناك دَوماً إهتمام بزيت السمسم وذلك نظراً للأهمية الكبيرة التي يحتويها زيت السمسم ."
                      "وقـــد كــان النـاس يحـصـلون عـلي زيـت السـمسـم بالـطـرق التـقلـيـديـه لعـل أشهـرها) المعصرة الشعبية ( أو ) عصارة الجمل ( وهي تقليدية وعُرضه أكثر للتلوث ."
                      "ولكن ظهرت بعد ذلك ) المعاصر الآليه( التي تسهل عمـلية الحـصول علي زيت السمــسم كـما انها أسرع واقل عُرضه للتلوث ."
                      "وقد تحدث الكثير من العلماء عن أهميه زيت السمسم وفوائده ولا نقصد علماء العصر الحديث فقط بل أدرك ايضاً العلماء االقدامي فوائد زيت السمسم ."
                  ,style: Text_Style().content(colormarket),)
                ],),
              ),
              SizedBox(height: 30,),
              Text("فوائد زيت السمسم",style:Text_Style().content(colormarket)),
              SizedBox(height: 50,),
              Container(
                width: size_phone.width!*.7,
                child: Text("تـَكمُن فوائد زيـت السمسم في العناصر التي يحتويها فزيت السمسم يحتوي علي فيتامينات مهمه مثل فيتامين ) ج ، ب6 ، هـ ( كما أنه يحتوي علي أحماض) الأوليك و اللينولئيك و البالميتيك ( ومعادن) كالبوتاسيوم و الماغنسيوم( ."

                    "كيفية استخراج زيت السمسم ؟"
                    "يُستـخرج زيـت الـسمسم عن طريق عـصر حَب السمـسم في معاصـر خاصة ، ويُعـصر حب السمسم باردا بعد إزالة الشوائب منه."

                    "وهنا تجد أنه من أبسط المشاريع التي تُدر دخلاً عالياً  كما أن ليس به الكثير من  الخطوات لتنفيذه."

                    "فلِعمل مشروع معصرة زيت السمسم تحتاج الي:",style:Text_Style().content(colormarket)),
              ),
              SizedBox(height: 30,),
              Text("1( معصرة زيت السمسم .",style:Text_Style().content(colormarket)),
              Text("  2( عامل إنتاج للإشراف علي عمليه العصر .",style:Text_Style().content(colormarket)),
              Text(" 3( فرد تسويق للمُنتج المُتمثل في)زيت السمسم(",style:Text_Style().content(colormarket)),
              Text ("- ونجد ان مدخلات الإنتاج هي  )حب السمـسم(."
                  " – ونجد ان مخرجات الإنتاج هو) زيت السمسم(.",style:Text_Style().content(colormarket)
              )
            ],
          ),
        ),
      ),
    );
  }
}
