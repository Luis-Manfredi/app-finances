import 'package:flutter/material.dart';

class SettingTile{
  String name, footer;
  IconData icon;

  SettingTile({required this.name, required this.footer, required this.icon});
}

List<SettingTile> settingsTiles = [
  SettingTile(name: 'Theme', footer: 'Customize your app', icon: Icons.color_lens_rounded),
  SettingTile(name: 'Automation', footer: 'Automatize your actions', icon: Icons.developer_mode_rounded),
  SettingTile(name: 'Account', footer: 'Manage your accounts', icon: Icons.manage_accounts_rounded),
  SettingTile(name: 'Support', footer: 'Contact support for more info', icon: Icons.support_agent_rounded)
];