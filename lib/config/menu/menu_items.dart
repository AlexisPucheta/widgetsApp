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
  MenuItems(
    title: 'Snackbars and dialogs',
    subtitle: 'Indicadores en pantalla',
    icon: Icons.info_outline,
    link: '/snackbars',
  ),
  MenuItems(
    title: 'Animated Container',
    subtitle: 'Stateful widget animated',
    icon: Icons.check_box_outlined,
    link: '/animated',
  ),
  MenuItems(
    title: 'UI Controls',
    subtitle: 'Flutter UI controls',
    icon: Icons.car_rental_outlined,
    link: '/ui-controls',
  ),
  MenuItems(
    title: 'App Tutorial',
    subtitle: 'Quick tutorial',
    icon: Icons.track_changes_outlined,
    link: '/app-tutorial',
  ),
  MenuItems(
    title: 'Infinite Scroll',
    subtitle: 'Infinite scroll with pagination',
    icon: Icons.screen_lock_landscape,
    link: '/infinite-scroll',
  ),
];
