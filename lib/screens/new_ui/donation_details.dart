import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationDetailsPage extends StatefulWidget {
  final Donation donation;
  final bool isOwner;
  bool isFavorite;
  DonationDetailsPage({super.key, required this.donation, required this.isOwner, required this.isFavorite});

  @override
  State<DonationDetailsPage> createState() => _DonationDetailsPageState();
}

class _DonationDetailsPageState extends State<DonationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    final fav = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFF039C8A), Color(0xFF0484D9), Color(0xFFEE3985), Color(0xFF039C8A), Color(0xFF0484D9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              height: 2.0,
            ),
          )),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.donation.imageUrl ?? ''),
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        )),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !widget.isOwner,
                  child: IconButton(
                      onPressed: () async {
                        if (user.uid == null) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                      title: const Text('يجب تسجيل الدخول اولاً'),
                                      content: const Text('يجب تسجيل الدخول اولاً لاضافة الاعلان الى قائمة الرغبات'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('حسناً'))
                                      ]));
                          return;
                        }
                        if (widget.isFavorite) {
                          // await DatabaseService().deleteItemFromWishList(itemId: widget.donation.id, userId: user.uid);
                          fav.removeFavorite(widget.donation);
                          if (mounted) {
                            setState(() {
                              widget.isFavorite = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('تمت الازالة من قائمة الرغبات'),
                            ));
                          }
                          return;
                        } else {
                          // await DatabaseService().addItemToWhishList(user: user.uid, itemId: widget.donation.id);
                          fav.addFavorite(widget.donation);
                          if (mounted) {
                            setState(() {
                              widget.isFavorite = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('تمت الاضافة الى قائمة الرغبات'),
                            ));
                          }
                          return;
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: widget.isFavorite ? const Color(0xFFEE3985) : null,
                      )),
                ),
                Text(
                  widget.donation.name ?? "No name found",
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'المكان: ${widget.donation.location}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'النوع: ${widget.donation.category}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                color: Color(0xFFE5E5E5),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                        'تفاصيل',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        widget.donation.description ?? 'No description found',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          user.uid != widget.donation.donorID
                              ? ElevatedButton(
                                  onPressed: () async {
                                    await launchUrl(
                                      Uri.parse('https://wa.me/+966${widget.donation.phoneNumber!.substring(1)}'),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF213753))),
                                  child: const Text(
                                    'تواصل مع المعلن',
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('هل انت متأكد من انهاء الاعلان؟'),
                                        content: const Text('سيتم انهاء الاعلان وحذفه من القائمة'),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              await DatabaseService().deleteItem(itemId: widget.donation.id);
                                              if (mounted) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: const Text(
                                              'نعم',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'لا',
                                              style: TextStyle(
                                                color: Color(0xFF213753),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      const Color(0xFF213753),
                                    ),
                                  ),
                                  child: const Text(
                                    'انهاء الاعلان',
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
