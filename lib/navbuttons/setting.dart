import 'package:MeroDin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        toolbarOpacity: 0.9,
        title: Text(
          "",
        ),
        actions: <Widget>[
          Icon(Icons.help),
        ],
      ),
      body: Container(
        color: Color(0xFFFFE082),
        child: SettingsList(
          sections: [
            SettingsSection(
              title: 'Common',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onTap: () {},
                ),
                SettingsTile(
                    title: 'Environment',
                    subtitle: 'Production',
                    leading: Icon(Icons.cloud_queue)),
              ],
            ),
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                    title: 'Addd Phone number', leading: Icon(Icons.phone)),
                SettingsTile(
                    title: 'Update Username', leading: Icon(Icons.person)),
                SettingsTile(
                  title: 'Sign out',
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    Provider.of<AuthService>(context, listen: false).signout();
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Secutiry',
              tiles: [
                // SettingsTile.switchTile(
                //     title: 'Use fingerprint',
                //     leading: Icon(Icons.fingerprint),
                //     onToggle: (bool value) {},
                //     switchValue: false),
                SettingsTile(
                  title: 'Change password',
                  leading: Icon(Icons.lock),
                  onTap: () {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Misc',
              tiles: [
                SettingsTile(
                    title: 'Terms of Service',
                    leading: Icon(Icons.description)),
                SettingsTile(
                    title: 'Open source licenses',
                    leading: Icon(Icons.collections_bookmark)),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
