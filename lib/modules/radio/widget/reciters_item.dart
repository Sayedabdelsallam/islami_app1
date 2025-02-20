import 'package:flutter/material.dart';
import 'package:islami_app/models/reciters_response_model.dart';
import 'package:islami_app/provider/radio_manger_provider.dart';
import 'package:provider/provider.dart';
import '../../../shared/colors.dart';

class RecitersItem extends StatefulWidget {
  const RecitersItem({super.key, required this.recitersModel,});

  final RecitersItemEntity recitersModel;

  @override
  State<RecitersItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RecitersItem> {

  String? url;
  @override
  initState() {
    getUrl();
    super.initState();
  }

  void getUrl()
  {
    url = "${widget.recitersModel.moshaf![0].server}112.mp3";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isMuted = true;
    return Consumer<RadioMangerProvider>(
      builder:
          (BuildContext context,
          RadioMangerProvider provider,
          Widget? child,
          ) {
        return Container(
          height: size.height * 0.13,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/radioBG.png',
              ),
              fit: BoxFit.fill,
            ),
            color: MyColors.primary,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              Text(
                '${widget.recitersModel.name}',
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${widget.recitersModel.moshaf![0].name}',
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: size.height * 0.015,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      provider.play(url!);
                    },
                    icon: Icon(
                      (provider.currentPlayingUrl == url && provider.isPlaying == true)
                          ?Icons.pause : Icons.play_arrow_rounded,
                      color: MyColors.black,
                      size: size.height * 0.05,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if(provider.currentPlayingUrl == url)
                      {provider.stop();}
                    },
                    icon: Icon(
                      Icons.stop,
                      color: MyColors.black,
                      size: size.height * 0.05,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      isMuted = !isMuted;
                      setState(() {});
                      provider.setVolume(isMuted ? 2.0 : 0.0);
                    },
                    icon: Icon(
                      isMuted
                          ? Icons.volume_up
                          : Icons.volume_off,
                      color: MyColors.black,
                      size: size.height * 0.04,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
