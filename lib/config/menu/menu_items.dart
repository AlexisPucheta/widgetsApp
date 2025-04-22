import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final IconData icon;
  final String link;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.link,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    icon: Icons.smart_button_outlined,
    link: '/buttons',
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    icon: Icons.credit_card,
    link: '/cards',
  ),
  MenuItems(
    title: 'ProgressIndicators',
    subtitle: 'Generales y controlados',
    icon: Icons.refresh_rounded,
    link: '/progress',
  ),
];
