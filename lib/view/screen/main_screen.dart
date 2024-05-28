
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:github_io_0x7han/view/screen/header_screen.dart';
import 'package:github_io_0x7han/view/widget/custom_bagde_widget.dart';
import 'package:github_io_0x7han/view/widget/custom_card_widget.dart';
import 'package:github_io_0x7han/view/widget/custom_container_widget.dart';
import 'package:github_io_0x7han/view/widget/custom_section_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void> (
      context: context,
      builder: (BuildContext context) {
        return ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: AlertDialog(
                          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
              title: const Text('Bonjour'),
              content: Text('Still in development 🚧🏗️'),
              actions: [
                FilledButton.tonal(onPressed: ()=> Navigator.of(context).pop(), child: Text('Ok'))
              ],
            ),
            
                    ),
                  );
      },
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  _dialogBuilder(context);
});
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          read.setPosCursor(event.position);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: watch.posCursor.dx - 350,
              top: watch.posCursor.dy - 350,
              child: Container(
                width: 700,
                height: 700,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colorScheme.primary.withOpacity(0.2),
                      colorScheme.primary.withOpacity(0.0),
                    ],
                    stops: const [0.0, 0.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.25),
                      spreadRadius: 100,
                      blurRadius: 100,
                    ),
                  ],
                ),
              ),
            ),
            Container(

              color: colorScheme.surface.withOpacity(0.7),
            ),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Container(
                width: 1200,
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    IconButton.filledTonal(
                            onPressed: () {},
                            icon: Icon(
                              Icons.color_lens_rounded,
                              color: colorScheme.primary,
                            )),
                            SizedBox(height: 32,),
                    const HeaderScreen(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomContainerWidget(
                            key: Key('aboutme'),
                            children: [
                              CustomSectionWidget(
                                title: 'About Me',
                                content: Text(
                                  "I've been deeply immersed in the world of technology as an IT Support professional. Over four years, I've meticulously managed IT infrastructure, ensured software and hardware are up-to-date, and provided responsive tech support.",
                                ),
                                actions: [
                                  CustomBadgeWidget(
                                    isIncrase: true,
                                    label: '4',
                                    contents: [
                                      Text('years of'),
                                      Text('experiences'),
                                    ],
                                  ),
                                  CustomBadgeWidget(
                                    label: '5',
                                    contents: [
                                      Text('projects'),
                                    ],
                                  ),
                                  CustomBadgeWidget(
                                    isIncrase: true,
                                    label: '9',
                                    contents: [
                                      Text('certificates'),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          CustomContainerWidget(
                            key: const Key('experiences'),
                            children: [
                              CustomSectionWidget(
                                title: 'Experiences',
                                content: Column(
                                  children: [
                                    CustomCardWidget.experience(
                                      const Key('ermansyah_group'),
                                      context,
                                      date: 'July 2019 - Now',
                                      place: 'Ermansyah Group',
                                      type : 'Part Time',
                                      role: 'IT Support',
                                      description:
                                          'Planning and executing technology infrastructure procurement, managing budgets, IT asset management, configuring secure Mikrotik-based networks, developed pharmaceutical applications using Flutter, created pharmaceutical running-text advertisements with Arduino-configured LED modules, performing OS and hardware installations.',
                                      chips: [
                                        'Support',
                                        'Asset Management',
                                        'CCTV',
                                        'Flutter',
                                        'Mikrotik',
                                        'Arduino',
                                      ],
                                    ),
                                    CustomCardWidget.experience(
                                      const Key('pt_global_innovation_technology'),
                                      context,
                                      date: 'November 2023 - February 2024',
                                      place: 'PT Global Innovation Technology',
                                      type: 'Full Time',
                                      role: 'Technical Consultant',
                                      description:
                                          'Ensuring computers and networks function properly, applications run smoothly, data security, repairing damaged computers, updating systems and backing up data, ensuring peripheral devices operate, designing networks, installing antivirus software, maintaining PC servers, performing database queries and updates, and maintaining and developing ERP and SAP applications.',
                                      chips: [
                                        'Troubleshooting',
                                        'Maintenance',
                                        'Report',
                                        'Queries',
                                        'SAP B1',
                                      ],
                                    ),
                                    CustomCardWidget.experience(
                                      const Key('smk_plus_pratama_adi'),
                                      context,
                                      date: 'July 2021 - July 2022',
                                      place: 'SMK Plus Pratama Adi',
                                      type: 'Part Time',
                                      role: 'Teacher',
                                      description:
                                          'Teach programming fundamentals using C++ to first-grade students, introduce Java-based object-oriented programming concepts to second graders, and cover advanced Java topics with a focus on MySQL database integration for third graders.',
                                      chips: [
                                         'Guiding',
                                        'Object Oriented Programming',
                                        'C++',
                                        'Java',
                                        'MySQL',
                              
                                      ],
                                    ),
                                    CustomCardWidget.experience(
                                      const Key('pt_pertamina_ge_area_kamojang'),
                                      context,
                                      date: 'November 2017 - January 2018',
                                      place: 'PT Pertamina Geothermal Energy Area Kamojang',
                                      type: 'Full Time',
                                      role: 'Internship',
                                      description:
                                          "Meticulous computer assembly, troubleshooting hardware and software issues, OS installation, and configuring required applications. Additionally, it includes setting up local area networks (LAN) for seamless connectivity in the company's work environment.",
                                      chips: [
                                                                                  'Computer Assembly',
                                        'OS Installation',
                                        'Applications',
                                        'Local Area Network',
                                      ],
                                    ),
                                  ],
                                ),
                                actions: const [],
                              )
                            ],
                          ),
                          const CustomContainerWidget(
                            key: Key('projects'),
                            children: [
                              CustomSectionWidget(
                                title: 'Projects',
                                content: Column(
                                  children: [
                                    
                                  ],
                                ),
                                actions: [],
                              )
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Debug'),
                    Text('Width : ${size.width} | Height : ${size.height}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
