Assets {
  Id: 14422027815974382077
  Name: "METAPlayerTitles_Configurator"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 18148658078338840680
      Objects {
        Id: 18148658078338840680
        Name: "METAPlayerTitles_Configurator"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10497177608845763861
        ChildIds: 14208370963874050616
        ChildIds: 6827826702186852842
        ChildIds: 9311108598448503833
        ChildIds: 18219663278939993150
        ChildIds: 212928068021008926
        ChildIds: 2476167449649329883
        UnregisteredParameters {
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "METAPlayerTitles_Configurator"
        }
      }
      Objects {
        Id: 14208370963874050616
        Name: "Common"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        UnregisteredParameters {
          Overrides {
            Name: "cs:TeamNeutralColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:TeamEnemyColor"
            Color {
              R: 0.964686573
              G: 0.0497065745
              B: 0.0497065745
              A: 1
            }
          }
          Overrides {
            Name: "cs:TeamFriendlyColor"
            Color {
              R: 0.00856812485
              G: 0.361306876
              B: 0.799102962
              A: 1
            }
          }
          Overrides {
            Name: "cs:TeamSelfColor"
            Color {
              R: 0.00856812485
              G: 0.361306876
              B: 0.799102962
              A: 1
            }
          }
          Overrides {
            Name: "cs:TeamNeutralColor:tooltip"
            String: "The color to use for neutral players (in the context of team relations)."
          }
          Overrides {
            Name: "cs:TeamEnemyColor:tooltip"
            String: "The color to use for enemy players (in the context of team relations)."
          }
          Overrides {
            Name: "cs:TeamFriendlyColor:tooltip"
            String: "The color to use for friendly players (in the context of team relations)."
          }
          Overrides {
            Name: "cs:TeamSelfColor:tooltip"
            String: "The color to use for the local player (in the context of team relations)."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Common"
        }
      }
      Objects {
        Id: 6827826702186852842
        Name: "Titles"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        ChildIds: 8082826371295309414
        ChildIds: 581386855642718027
        ChildIds: 10400019332374687864
        ChildIds: 4953614626465234481
        ChildIds: 10389517128414632044
        ChildIds: 16500169094052482629
        ChildIds: 1645301479855855530
        ChildIds: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:DefaultTitle"
            ObjectReference {
              SubObjectId: 8082826371295309414
            }
          }
          Overrides {
            Name: "cs:DefaultTitle:tooltip"
            String: "Core Object Reference to the entry that defines the default title, to be applied when a player does not have a set title."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Titles"
        }
      }
      Objects {
        Id: 8082826371295309414
        Name: "Default Title"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Player"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 841534158063459245
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 0.5
              G: 0.5
              B: 0.5
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Default Title"
        }
      }
      Objects {
        Id: 581386855642718027
        Name: "Game Creator"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Game Creator"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              G: 0.75
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 5129014730210097581
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              G: 0.75
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
              X: 4
              Y: 4
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: true
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Game Creator"
        }
      }
      Objects {
        Id: 10400019332374687864
        Name: "Moderator"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Moderator"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              G: 0.6
              B: 0.2
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 9738688525360925377
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              G: 0.6
              B: 0.2
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
              X: 4
              Y: 4
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: true
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Moderator"
        }
      }
      Objects {
        Id: 4953614626465234481
        Name: "Contributor"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Contributor"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 1
              G: 0.176470578
              B: 0.3529405
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 11232416293698382143
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 1
              G: 0.176470578
              B: 0.3529405
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
              X: 4
              Y: 4
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Contributor"
        }
      }
      Objects {
        Id: 10389517128414632044
        Name: "Quality Assurance"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Tester"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 1
              G: 0.176470578
              B: 0.3529405
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 6489266249843332418
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 1
              G: 0.176470578
              B: 0.3529405
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
              X: 4
              Y: 4
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Quality Assurance"
        }
      }
      Objects {
        Id: 16500169094052482629
        Name: "Content Creator"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        ChildIds: 11915782065123767809
        ChildIds: 318373897702449623
        ChildIds: 3397268199534450473
        ChildIds: 14884475478765231268
        ChildIds: 4100964845950257761
        ChildIds: 270767524188549804
        ChildIds: 2881244425428650604
        ChildIds: 15459241152027395900
        ChildIds: 13506665287524532555
        ChildIds: 2886521030082077833
        ChildIds: 13743368117243834200
        ChildIds: 16617443843141007556
        ChildIds: 2165355121103357985
        ChildIds: 9832028803407552609
        ChildIds: 1257210804188023078
        ChildIds: 14649963934128949309
        ChildIds: 91993814830822493
        ChildIds: 13235990868517900390
        ChildIds: 5064084769609547846
        ChildIds: 17303289216619758049
        ChildIds: 12062631381026758550
        ChildIds: 12442067786852216568
        ChildIds: 4291737791998627023
        ChildIds: 15557767220013683684
        ChildIds: 15239004600456978009
        ChildIds: 6234854708654047621
        ChildIds: 4435825606158170432
        ChildIds: 8796237671332316569
        ChildIds: 14126347449113239345
        ChildIds: 14746616144954316715
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Content Creator"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 0.896269679
              G: 0.637597
              B: 0.332451582
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 6595698929899861519
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 0.896269679
              G: 0.637597
              B: 0.332451582
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Content Creator"
        }
      }
      Objects {
        Id: 11915782065123767809
        Name: "LuckofBuck (https://www.tiktok.com/@luckofbuckdev)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "e21aadb442b44ccaa39b2c4b12929f85"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "LuckofBuck (https___www_tiktok_com__luckofbuckdev)"
        }
      }
      Objects {
        Id: 318373897702449623
        Name: "marcepan (https://www.tiktok.com/@rippleoverdrive)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "2966d17cd7734da19e882335efffc4b8"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "marcepan (https___www_tiktok_com__rippleoverdrive)"
        }
      }
      Objects {
        Id: 3397268199534450473
        Name: "OwndogGames (https://www.twitch.tv/owndoggames)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "6035ae98674b45b690520eac49b0e78f"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "OwndogGames (https___www_twitch_tv_owndoggames)"
        }
      }
      Objects {
        Id: 14884475478765231268
        Name: "mtgnerdgirl (https://sullygnome.com/channel/mtgnerdgirl)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "ad3780ec764745e1b74d9372e44b62fc"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "mtgnerdgirl (https___sullygnome_com_channel_mtgnerdgirl)"
        }
      }
      Objects {
        Id: 4100964845950257761
        Name: "LanaLux (https://www.twitch.tv/lana_lux)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "4201c90059e44d1e97e36e2c7bac5a23"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "LanaLux (https___www_twitch_tv_lana_lux)"
        }
      }
      Objects {
        Id: 270767524188549804
        Name: "Jaxboxchick (https://www.twitch.tv/thatJaxboxchick)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "9bbb9aa699574f38a343965288ea3631"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Jaxboxchick (https___www_twitch_tv_thatJaxboxchick)"
        }
      }
      Objects {
        Id: 2881244425428650604
        Name: "TheBronzeSword (https://www.twitch.tv/thebronzesword)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "9b74b9b6e1b44f2cb9d0e32542f45dd0"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "TheBronzeSword (https___www_twitch_tv_thebronzesword)"
        }
      }
      Objects {
        Id: 15459241152027395900
        Name: "MetsuRjKen (https://www.twitch.tv/metsurjken)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "3f3df1fed0e94e3fb104565b105719b1"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "MetsuRjKen (https___www_twitch_tv_metsurjken)"
        }
      }
      Objects {
        Id: 13506665287524532555
        Name: "Aphrim (https://www.youtube.com/c/Aphrim/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "a7fa1014cab64595bee90b0049070c8e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Aphrim (https___www_youtube_com_c_Aphrim_videos)"
        }
      }
      Objects {
        Id: 2886521030082077833
        Name: "Morticai (https://www.youtube.com/c/GamerTitanYT/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d1073dbcc404405cbef8ce728e53d380"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Morticai (https___www_youtube_com_c_GamerTitanYT_videos)"
        }
      }
      Objects {
        Id: 13743368117243834200
        Name: "YoinkedGaming (https://www.youtube.com/c/YoinkedGaming/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "7430e37520c048f6b5a2f1bed6ffe806"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "YoinkedGaming (https___www_youtube_com_c_YoinkedGaming_videos)"
        }
      }
      Objects {
        Id: 16617443843141007556
        Name: "Ducain23 (https://www.youtube.com/c/DucainPlays/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "5359877205574a7eaff309a89f7b3ba2"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Ducain23 (https___www_youtube_com_c_DucainPlays_videos)"
        }
      }
      Objects {
        Id: 2165355121103357985
        Name: "StormHawk (https://www.youtube.com/c/StormHawk/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "5404592aaf464226a7d5d854df570ee1"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "StormHawk (https___www_youtube_com_c_StormHawk_videos)"
        }
      }
      Objects {
        Id: 9832028803407552609
        Name: "RayBenefield (https://www.youtube.com/c/RayBenefield/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d71bfcddd01347a4ae597d5cf6d9e644"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "RayBenefield (https___www_youtube_com_c_RayBenefield_videos)"
        }
      }
      Objects {
        Id: 1257210804188023078
        Name: "Devoun (https://www.youtube.com/c/devoun)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "a299961f22cf4ef1a7247951e254481f"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Devoun (https___www_youtube_com_c_devoun)"
        }
      }
      Objects {
        Id: 14649963934128949309
        Name: "DVPlays (https://www.youtube.com/c/DVwastaken/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "eb1c0ef104ec431aa943946ff2c44f58"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "DVPlays (https___www_youtube_com_c_DVwastaken_videos)"
        }
      }
      Objects {
        Id: 91993814830822493
        Name: "Matworks (https://www.youtube.com/c/MATHIEU_YT/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "5d18ee73e6a4425daf1ff036dc341db7"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Matworks (https___www_youtube_com_c_MATHIEU_YT_videos)"
        }
      }
      Objects {
        Id: 13235990868517900390
        Name: "LotusCracker (https://www.youtube.com/c/lotuscracker)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "111fdb0a14b0407cb48f5856cf6f8f6e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "LotusCracker (https___www_youtube_com_c_lotuscracker)"
        }
      }
      Objects {
        Id: 5064084769609547846
        Name: "pinkpockettv (https://www.youtube.com/c/pinkpocketTV/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "634f2c4edc2d468da55bd1f678381643"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "pinkpockettv (https___www_youtube_com_c_pinkpocketTV_videos)"
        }
      }
      Objects {
        Id: 17303289216619758049
        Name: "Noangy (https://www.youtube.com/c/BetronerGames/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d9f857d1115340268b03028e448e7022"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Noangy (https___www_youtube_com_c_BetronerGames_videos)"
        }
      }
      Objects {
        Id: 12062631381026758550
        Name: "ICEARROW_YOUTUBE (https://www.youtube.com/c/IceArrow/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "ff38c9b715124d9a98273b11be6e3ca7"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "ICEARROW_YOUTUBE (https___www_youtube_com_c_IceArrow_videos)"
        }
      }
      Objects {
        Id: 12442067786852216568
        Name: "Mucusinator (https://www.youtube.com/c/Arkpoint/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "94d3fd50c4824f019421895ec8dbf099"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Mucusinator (https___www_youtube_com_c_Arkpoint_videos)"
        }
      }
      Objects {
        Id: 4291737791998627023
        Name: "FLEX_CHADWELL (https://www.twitch.tv/flex_chadwell)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d8b4a33bd7474f88b15dc615b0d1b493"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "FLEX_CHADWELL (https___www_twitch_tv_flex_chadwell)"
        }
      }
      Objects {
        Id: 15557767220013683684
        Name: "GGJay (https://www.twitch.tv/ggjay)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "bb257393aaae4c85bb9456f26997b302"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "GGJay (https___www_twitch_tv_ggjay)"
        }
      }
      Objects {
        Id: 15239004600456978009
        Name: "Twitch-RaynRaps (https://www.twitch.tv/raynraps/)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "1b180f2e6e5e44dea53e90a75f6bb77f"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Twitch-RaynRaps (https___www_twitch_tv_raynraps_)"
        }
      }
      Objects {
        Id: 6234854708654047621
        Name: "KainAkin"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "45a7ca3b086645679b2acf7721b060bf"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "KainAkin"
        }
      }
      Objects {
        Id: 4435825606158170432
        Name: "AtariKafa (https://www.twitch.tv/atarikafa)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c3c1d0532c564d70850b992a1c2f2fb7"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "AtariKafa (https___www_twitch_tv_atarikafa)"
        }
      }
      Objects {
        Id: 8796237671332316569
        Name: "MrViirtuoz (https://www.youtube.com/user/MrVirTuoZLP/videos)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "f8bb887d774c486cb5c8f66625a8f011"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "MrViirtuoz (https___www_youtube_com_user_MrVirTuoZLP_videos)"
        }
      }
      Objects {
        Id: 14126347449113239345
        Name: "Vilva (https://youtube.com/c/vilva1)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "94473ebbd6ea41fa81c165f7a73d3acb"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Vilva (https___youtube_com_c_vilva1)"
        }
      }
      Objects {
        Id: 14746616144954316715
        Name: "Bearskopff (https://www.youtube.com/c/BearlyRegal)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 16500169094052482629
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "29f056813e1e491eafe7d6e258cfc010"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Bearskopff (https___www_youtube_com_c_BearlyRegal)"
        }
      }
      Objects {
        Id: 1645301479855855530
        Name: "Team META"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        ChildIds: 11622366564640220137
        ChildIds: 15002641283978117136
        ChildIds: 6459137690371101807
        ChildIds: 4090796147330355868
        ChildIds: 17018659205995401863
        ChildIds: 9298657433983533127
        ChildIds: 4977681476051855887
        ChildIds: 17528284318735100143
        ChildIds: 3737559999387298689
        ChildIds: 9214883746395951932
        ChildIds: 5615948422367884979
        ChildIds: 4137582682639925913
        ChildIds: 16927872156341228520
        ChildIds: 1801798077449758070
        ChildIds: 6039004088838331342
        ChildIds: 2623757629373762651
        ChildIds: 15837692305128659340
        ChildIds: 7596484026491318158
        ChildIds: 12210748519148863943
        ChildIds: 3354374502626838041
        ChildIds: 3288048853553099628
        ChildIds: 12681439877586807336
        ChildIds: 10617625767295992920
        ChildIds: 12652750729298941821
        ChildIds: 10099755813949037544
        ChildIds: 15942833602337493829
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Team META"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 0.332451582
              G: 0.0202885587
              B: 0.434153706
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 12643252433729064444
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 0.332451582
              G: 0.0202885587
              B: 0.434153706
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 45
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Team META"
        }
      }
      Objects {
        Id: 11622366564640220137
        Name: "Team META Account"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "ef18f7661bf14d0eae60d7f31ea769af"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Team META Account"
        }
      }
      Objects {
        Id: 15002641283978117136
        Name: "Aggripina (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d6d9d578840a44c79a3f05c15de23bf8"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Aggripina (Lead)"
        }
      }
      Objects {
        Id: 6459137690371101807
        Name: "Aj"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "eea739085f20445392c0ab999ab87bb6"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Aj"
        }
      }
      Objects {
        Id: 4090796147330355868
        Name: "AwkwardGameDev (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "557d4f1ae17646579646dfd20dcb7b66"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "AwkwardGameDev (Lead)"
        }
      }
      Objects {
        Id: 17018659205995401863
        Name: "blaking707 (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "0ea6612ceab7456a8a3a963a94808295"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "blaking707 (Lead)"
        }
      }
      Objects {
        Id: 9298657433983533127
        Name: "Burnzie"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "05844b173bca411582347a1d07d953f2"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Burnzie"
        }
      }
      Objects {
        Id: 4977681476051855887
        Name: "Chipnertkj ;)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "aabffd57e2814ff1bc7f80f5fd32b5a4"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Chipnertkj ;)"
        }
      }
      Objects {
        Id: 17528284318735100143
        Name: "Coderz"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d5daea732ee3422fbe85aecb900e73ec"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Coderz"
        }
      }
      Objects {
        Id: 3737559999387298689
        Name: "Daddio"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "1f0588bf88d14c258d7384902f71f132"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Daddio"
        }
      }
      Objects {
        Id: 9214883746395951932
        Name: "Datonare"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "0b63f4ffba9c4518b50e4f815a9ec51a"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Datonare"
        }
      }
      Objects {
        Id: 5615948422367884979
        Name: "Divide"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "eaba4947069846dbb72fc5efb0f04f47"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Divide"
        }
      }
      Objects {
        Id: 4137582682639925913
        Name: "Egg"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "df38a4dc4cf245e48f6b961570137dc2"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Egg"
        }
      }
      Objects {
        Id: 16927872156341228520
        Name: "estlogic"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "385b45d7abdb499f8664c6cb01df521b"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "estlogic"
        }
      }
      Objects {
        Id: 1801798077449758070
        Name: "mjcortes782"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "91166471c6ea4d17be6772da4973e6b7"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "mjcortes782"
        }
      }
      Objects {
        Id: 6039004088838331342
        Name: "Jarsa"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "fc5fca8d934b4e5f9120f67dd7eb7449"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Jarsa"
        }
      }
      Objects {
        Id: 2623757629373762651
        Name: "KonzZwodrei"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "fdb45035857a4e87b17344cd891c48c5"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "KonzZwodrei"
        }
      }
      Objects {
        Id: 15837692305128659340
        Name: "LotusCracker"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "111fdb0a14b0407cb48f5856cf6f8f6e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "LotusCracker"
        }
      }
      Objects {
        Id: 7596484026491318158
        Name: "Melamoryxq (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "9cc8d222e6d14da68dc2ba0a9a4f0439"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Melamoryxq (Lead)"
        }
      }
      Objects {
        Id: 12210748519148863943
        Name: "Morticai (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d1073dbcc404405cbef8ce728e53d380"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Morticai (Lead)"
        }
      }
      Objects {
        Id: 3354374502626838041
        Name: "Mucusinator"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "94d3fd50c4824f019421895ec8dbf099"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Mucusinator"
        }
      }
      Objects {
        Id: 3288048853553099628
        Name: "Ocylix"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "ca1f49507ccf4675984c59be9191cde6"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Ocylix"
        }
      }
      Objects {
        Id: 12681439877586807336
        Name: "Ooccoo (Lead)"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "a136c0d1d9454d539c9932354198fc29"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Ooccoo (Lead)"
        }
      }
      Objects {
        Id: 10617625767295992920
        Name: "Outrun"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c51d9bb1185a426fbee7e1b4ab27f26b"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Outrun"
        }
      }
      Objects {
        Id: 12652750729298941821
        Name: "Rolok"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "1f67a03d5a8f478b993aad1c79b45640"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Rolok"
        }
      }
      Objects {
        Id: 10099755813949037544
        Name: "Staypunny"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "0e0d7d0be7fa44d296dae3d2b26410f5"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Staypunny"
        }
      }
      Objects {
        Id: 15942833602337493829
        Name: "WindfallDrifter"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1645301479855855530
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "e730c40ae54d4c588658667927acc6d8"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "WindfallDrifter"
        }
      }
      Objects {
        Id: 15212463606543912763
        Name: "Manticore"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 6827826702186852842
        ChildIds: 14961766526997408670
        ChildIds: 10184506986679541545
        ChildIds: 18045242333333149657
        ChildIds: 292018785340999511
        ChildIds: 11155674904282156925
        ChildIds: 17987578165283501667
        ChildIds: 13038250361261425822
        ChildIds: 7056977425030269411
        ChildIds: 6723601035351887213
        ChildIds: 200902607778724658
        ChildIds: 8086768163243156949
        ChildIds: 14856868506307840917
        ChildIds: 12817049519435369879
        ChildIds: 17403452200840196220
        ChildIds: 6554120602038527979
        ChildIds: 2351016313624731536
        ChildIds: 17223343490864909641
        ChildIds: 11994209516251378607
        ChildIds: 16266354741315732331
        ChildIds: 1860606353258409797
        ChildIds: 9820456312673588940
        ChildIds: 3038997831806215281
        ChildIds: 11279297548481921198
        ChildIds: 9112680996912159308
        ChildIds: 1889221370851286880
        ChildIds: 3970004781551423390
        ChildIds: 14836204763430016852
        ChildIds: 14871398480255910402
        ChildIds: 14448896723613815856
        ChildIds: 11730555421619726890
        ChildIds: 10842325015980923758
        ChildIds: 1559417690365471968
        ChildIds: 293456740856333826
        ChildIds: 3185781156882040019
        ChildIds: 17525376054964936880
        ChildIds: 9695947438137048679
        UnregisteredParameters {
          Overrides {
            Name: "cs:Title"
            String: "Manticore"
          }
          Overrides {
            Name: "cs:TitleColor"
            Color {
              R: 1
              G: 0.3
              A: 1
            }
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 3724194992859379954
            }
          }
          Overrides {
            Name: "cs:IconColor"
            Color {
              R: 1
              G: 0.3
              A: 1
            }
          }
          Overrides {
            Name: "cs:IconRotation"
            Float: 0
          }
          Overrides {
            Name: "cs:IconSizeOffset"
            Vector2 {
            }
          }
          Overrides {
            Name: "cs:IsModerator"
            Bool: true
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Manticore"
        }
      }
      Objects {
        Id: 14961766526997408670
        Name: "aBomb"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "be501d1b587e4e6a81f301c72c8364a7"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "aBomb"
        }
      }
      Objects {
        Id: 10184506986679541545
        Name: "Anna"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "aabd84ef7a6448a69c331121b5909cff"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Anna"
        }
      }
      Objects {
        Id: 18045242333333149657
        Name: "Basilisk"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c14f61b74826471f974f06ff7e42d97b"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Basilisk"
        }
      }
      Objects {
        Id: 292018785340999511
        Name: "Bigglebuns"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "400d8e7acb154e5bb64368411824b61d"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Bigglebuns"
        }
      }
      Objects {
        Id: 11155674904282156925
        Name: "Buckmonster"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "901b7628983c4c8db4282f24afeda57a"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Buckmonster"
        }
      }
      Objects {
        Id: 17987578165283501667
        Name: "Bumblebear"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c643c92a06e943c4aef66a283f5dc1e0"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Bumblebear"
        }
      }
      Objects {
        Id: 13038250361261425822
        Name: "Chris"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d97586e1f850481da13ee26d5cbddc02"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Chris"
        }
      }
      Objects {
        Id: 7056977425030269411
        Name: "coreslinkous"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "3819113b7af34fb786a56960fc08136a"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "coreslinkous"
        }
      }
      Objects {
        Id: 6723601035351887213
        Name: "deadlyfishesMC"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "65f3dec3b6dd45c2845a55a7af240adc"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "deadlyfishesMC"
        }
      }
      Objects {
        Id: 200902607778724658
        Name: "Depp"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "2d38316ed3204388acbe3c225b0c0114"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Depp"
        }
      }
      Objects {
        Id: 8086768163243156949
        Name: "Dracowolfie"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "8aa6e0c558be4a1c98e80229b73ffeb9"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Dracowolfie"
        }
      }
      Objects {
        Id: 14856868506307840917
        Name: "featurecreeper"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "31f09de9539843a996ba240763f76641"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "featurecreeper"
        }
      }
      Objects {
        Id: 12817049519435369879
        Name: "Gabunir"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "cb055adaf34a4b72b7bd02c8ae5f3ec8"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Gabunir"
        }
      }
      Objects {
        Id: 17403452200840196220
        Name: "Griffin"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "74fd12a8ad1b4e3ca013946aa981b46e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Griffin"
        }
      }
      Objects {
        Id: 6554120602038527979
        Name: "Holy"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "f207385c066b429581e6fe11ac8795bf"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Holy"
        }
      }
      Objects {
        Id: 2351016313624731536
        Name: "JayDee"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "8a40a1c2c94f4fb0bd1430f4e37b121f"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "JayDee"
        }
      }
      Objects {
        Id: 17223343490864909641
        Name: "kytsu"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "d6c5b10f5bba4458acd46970eb25b227"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "kytsu"
        }
      }
      Objects {
        Id: 11994209516251378607
        Name: "lodle"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c1754d0e214741a9b15e2446ee730e68"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "lodle"
        }
      }
      Objects {
        Id: 16266354741315732331
        Name: "lokii"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "978d4261ff404208ba49de799ce5362c"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "lokii"
        }
      }
      Objects {
        Id: 1860606353258409797
        Name: "max"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "21db3c6e27af40e2aa8d78a67d0c6a32"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "max"
        }
      }
      Objects {
        Id: 9820456312673588940
        Name: "Mehaji"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "43522f2d40f5480e881ec7b89567007e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Mehaji"
        }
      }
      Objects {
        Id: 3038997831806215281
        Name: "mrbigfists"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "4d64fe2c095a45ab905923395d72f51e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "mrbigfists"
        }
      }
      Objects {
        Id: 11279297548481921198
        Name: "pchiu"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "5a7a3a3d8ccb4dc5837880f2df3002fc"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "pchiu"
        }
      }
      Objects {
        Id: 9112680996912159308
        Name: "Poippels"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "dabe472c0b2e4d5a9f4edcec4a63ad8a"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Poippels"
        }
      }
      Objects {
        Id: 1889221370851286880
        Name: "qualispec"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "83ef77fc3dc1409992d549a68dd616dd"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "qualispec"
        }
      }
      Objects {
        Id: 3970004781551423390
        Name: "Robotron"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "20dba0f31f1b4f889b6bd70cdaaab192"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Robotron"
        }
      }
      Objects {
        Id: 14836204763430016852
        Name: "rbrown"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "b06d130e5afd418d8ecfce2150450c69"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "rbrown"
        }
      }
      Objects {
        Id: 14871398480255910402
        Name: "Scav"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "c078c42a742146bd99404099e4781e88"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Scav"
        }
      }
      Objects {
        Id: 14448896723613815856
        Name: "Sobchak"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "9b1e28cbd1d74f5fb4c2ddea6d81fd39"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Sobchak"
        }
      }
      Objects {
        Id: 11730555421619726890
        Name: "standardcombo"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "b4c6e32137e54571814b5e8f27aa2fcd"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "standardcombo"
        }
      }
      Objects {
        Id: 10842325015980923758
        Name: "Stanzilla"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "9bb9612e564644c58b2286a6853fb91e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Stanzilla"
        }
      }
      Objects {
        Id: 1559417690365471968
        Name: "Stephano"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "1c73b87d2d374264ab0eb4d89edc4b72"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Stephano"
        }
      }
      Objects {
        Id: 293456740856333826
        Name: "Tobs"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "54d6c37e71a546f7bfd480d8e654f45e"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Tobs"
        }
      }
      Objects {
        Id: 3185781156882040019
        Name: "Turbo"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "aea40b9e2fae46908e37b42d44f3b004"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Turbo"
        }
      }
      Objects {
        Id: 17525376054964936880
        Name: "Wafffle"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "581ff579fd864966aec56450754db1fb"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Wafffle"
        }
      }
      Objects {
        Id: 9695947438137048679
        Name: "zurishmi"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 15212463606543912763
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerMUID"
            String: "fc93f85ad76f49f6984403e2f5162bce"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "zurishmi"
        }
      }
      Objects {
        Id: 9311108598448503833
        Name: "Handler"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        UnregisteredParameters {
          Overrides {
            Name: "cs:HandlerInstance"
            ObjectReference {
              SelfId: 11724767167986023796
              SubObjectId: 3919527880117986418
              InstanceId: 5500048560983525449
              TemplateId: 16302603277956090916
            }
          }
          Overrides {
            Name: "cs:IconCount"
            Int: 8
          }
          Overrides {
            Name: "cs:IconEllipsisID"
            String: "#ellipsis"
          }
          Overrides {
            Name: "cs:PlayerSessionDataTemplate"
            AssetReference {
              Id: 832814938189886887
            }
          }
          Overrides {
            Name: "cs:TitleSessionDataTemplate"
            AssetReference {
              Id: 7646554208133475378
            }
          }
          Overrides {
            Name: "cs:HandlerInstance:tooltip"
            String: "Core Object Reference to the instance of the Player Titles Handler used for this game."
          }
          Overrides {
            Name: "cs:IconCount:tooltip"
            String: "The amount of icons on the player nameplate template."
          }
          Overrides {
            Name: "cs:IconEllipsisID:tooltip"
            String: "The IconID used to display an ellipsis on the last icon slot, to indicate that there are more icons set on the player than the nameplate can handle."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Handler"
        }
      }
      Objects {
        Id: 18219663278939993150
        Name: "Nameplates"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        ChildIds: 5639038189913808126
        UnregisteredParameters {
          Overrides {
            Name: "cs:NameColorMode"
            String: "STATIC"
          }
          Overrides {
            Name: "cs:NameStaticColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:HealthbarColorMode"
            String: "STATIC"
          }
          Overrides {
            Name: "cs:HealthbarStaticColor"
            Color {
              G: 0.5
              A: 1
            }
          }
          Overrides {
            Name: "cs:ShowSelf"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowNeutral"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowEnemy"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowFriendly"
            Bool: true
          }
          Overrides {
            Name: "cs:NameplateTemplate"
            AssetReference {
              Id: 13498140294371130688
            }
          }
          Overrides {
            Name: "cs:SocketHelperTemplate"
            AssetReference {
              Id: 799365241416341159
            }
          }
          Overrides {
            Name: "cs:NameColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player names."
          }
          Overrides {
            Name: "cs:HealthbarColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player healthbars."
          }
          Overrides {
            Name: "cs:NameStaticColor:tooltip"
            String: "The color to use when the color mode for player names is set to STATIC."
          }
          Overrides {
            Name: "cs:HealthbarStaticColor:tooltip"
            String: "The color to use when the color mode for player healthbars is set to STATIC."
          }
          Overrides {
            Name: "cs:ShowSelf:tooltip"
            String: "Whether to hide the nameplate of the local player."
          }
          Overrides {
            Name: "cs:ShowNeutral:tooltip"
            String: "Whether to hide the nameplates of neutral players."
          }
          Overrides {
            Name: "cs:ShowEnemy:tooltip"
            String: "Whether to hide the nameplates of enemy players."
          }
          Overrides {
            Name: "cs:ShowFriendly:tooltip"
            String: "Whether to hide the nameplates of friendly players."
          }
          Overrides {
            Name: "cs:NameplateTemplate:tooltip"
            String: "The template used as the nameplate template. There are different nameplate sizes available as templates packaged with this CC piece. You can find them in project content."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Nameplates"
        }
      }
      Objects {
        Id: 5639038189913808126
        Name: "Icons"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18219663278939993150
        ChildIds: 9916882333402670119
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Icons"
        }
      }
      Objects {
        Id: 9916882333402670119
        Name: "Example Icon"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5639038189913808126
        UnregisteredParameters {
          Overrides {
            Name: "cs:Color"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
          }
          Overrides {
            Name: "cs:Image"
            AssetReference {
              Id: 5374390865387286219
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Example Icon"
        }
      }
      Objects {
        Id: 212928068021008926
        Name: "List"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        UnregisteredParameters {
          Overrides {
            Name: "cs:NameColorMode"
            String: "STATIC"
          }
          Overrides {
            Name: "cs:NameStaticColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:SidebarColorMode"
            String: "TITLE"
          }
          Overrides {
            Name: "cs:SidebarStaticColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:ShowSelf"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowNeutral"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowEnemy"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowFriendly"
            Bool: true
          }
          Overrides {
            Name: "cs:KeybindToggle"
            String: "ability_extra_50"
          }
          Overrides {
            Name: "cs:EasingCurveIn"
            SimpleCurve {
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.1
                Value: 1
                ArriveTangent: -15
                LeaveTangent: -15
              }
              PreExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              PostExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              DefaultValue: 3.40282347e+38
            }
          }
          Overrides {
            Name: "cs:EasingCurveOut"
            SimpleCurve {
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Value: 1
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.1
                ArriveTangent: -15
                LeaveTangent: -15
              }
              PreExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              PostExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              DefaultValue: 3.40282347e+38
            }
          }
          Overrides {
            Name: "cs:EntryTemplate"
            AssetReference {
              Id: 10686218187995467333
            }
          }
          Overrides {
            Name: "cs:NameColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player names."
          }
          Overrides {
            Name: "cs:NameStaticColor:tooltip"
            String: "The color to use when the color mode for player names is set to STATIC."
          }
          Overrides {
            Name: "cs:ShowSelf:tooltip"
            String: "Whether to hide the entry of the local player."
          }
          Overrides {
            Name: "cs:ShowNeutral:tooltip"
            String: "Whether to hide the entries of neutral players."
          }
          Overrides {
            Name: "cs:ShowEnemy:tooltip"
            String: "Whether to hide the entries of enemy players."
          }
          Overrides {
            Name: "cs:ShowFriendly:tooltip"
            String: "Whether to hide the entries of friendly players."
          }
          Overrides {
            Name: "cs:SidebarColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player entry sidebars."
          }
          Overrides {
            Name: "cs:SidebarStaticColor:tooltip"
            String: "The color to use when the color mode for entry sidebars is set to STATIC."
          }
          Overrides {
            Name: "cs:KeybindToggle:tooltip"
            String: "The keybind used for toggling the visibility of this component. Default: F1 (ability_extra_50)"
          }
          Overrides {
            Name: "cs:EasingCurveIn:tooltip"
            String: "The simple curve to use for the animation of the component, played when it enters its visible state. The animation affects the y axis offset (= key value/max value) and opacity (= key value/max value) of the component."
          }
          Overrides {
            Name: "cs:EasingCurveOut:tooltip"
            String: "The simple curve to use for the animation of the component, played when it enters its hidden state. The animation affects the y axis offset (= key value/max value) and opacity (= key value/max value) of the component."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "List"
        }
      }
      Objects {
        Id: 2476167449649329883
        Name: "Scoreboard"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18148658078338840680
        ChildIds: 12568011602220996725
        UnregisteredParameters {
          Overrides {
            Name: "cs:NameColorMode"
            String: "STATIC"
          }
          Overrides {
            Name: "cs:NameStaticColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:SidebarColorMode"
            String: "TITLE"
          }
          Overrides {
            Name: "cs:SidebarStaticColor"
            Color {
              R: 0.85
              G: 0.85
              B: 0.85
              A: 1
            }
          }
          Overrides {
            Name: "cs:ShowSelf"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowNeutral"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowEnemy"
            Bool: true
          }
          Overrides {
            Name: "cs:ShowFriendly"
            Bool: true
          }
          Overrides {
            Name: "cs:KeybindToggle"
            String: "ability_extra_50"
          }
          Overrides {
            Name: "cs:EasingCurveIn"
            SimpleCurve {
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.03
                Value: 20
                ArriveTangent: 800
                LeaveTangent: 800
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.075
                Value: 35
                ArriveTangent: 100
                LeaveTangent: 100
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.125
                Value: 40
                LeaveTangent: 35
              }
              PreExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              PostExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
            }
          }
          Overrides {
            Name: "cs:EasingCurveOut"
            SimpleCurve {
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Value: 40
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.1
                Value: 20
                ArriveTangent: -500
                LeaveTangent: -500
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.15
                ArriveTangent: -15
                LeaveTangent: -15
              }
              PreExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
              PostExtrapolation {
                Value: "mc:erichcurveextrapolation:rcce_constant"
              }
            }
          }
          Overrides {
            Name: "cs:EntryTemplate"
            AssetReference {
              Id: 951981791825140815
            }
          }
          Overrides {
            Name: "cs:EntryScoreTemplate"
            AssetReference {
              Id: 16309384968720951965
            }
          }
          Overrides {
            Name: "cs:HeaderScoreTemplate"
            AssetReference {
              Id: 8730902231434174576
            }
          }
          Overrides {
            Name: "cs:NameColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player names."
          }
          Overrides {
            Name: "cs:NameStaticColor:tooltip"
            String: "The color to use when the color mode for player names is set to STATIC."
          }
          Overrides {
            Name: "cs:ShowSelf:tooltip"
            String: "Whether to hide the entry of the local player."
          }
          Overrides {
            Name: "cs:ShowNeutral:tooltip"
            String: "Whether to hide the entries of neutral players."
          }
          Overrides {
            Name: "cs:ShowEnemy:tooltip"
            String: "Whether to hide the entries of enemy players."
          }
          Overrides {
            Name: "cs:ShowFriendly:tooltip"
            String: "Whether to hide the entries of friendly players."
          }
          Overrides {
            Name: "cs:SidebarColorMode:tooltip"
            String: "[STATIC | TEAM | TITLE] The color mode to use for player entry sidebars."
          }
          Overrides {
            Name: "cs:SidebarStaticColor:tooltip"
            String: "The color to use when the color mode for entry sidebars is set to STATIC."
          }
          Overrides {
            Name: "cs:KeybindToggle:tooltip"
            String: "The keybind used for toggling the visibility of this component. Default: F1 (ability_extra_50)"
          }
          Overrides {
            Name: "cs:EasingCurveIn:tooltip"
            String: "The simple curve to use for the animation of the component, played when it enters its visible state. The animation affects the y axis offset (= key value) and opacity (= key value/max value) of the component."
          }
          Overrides {
            Name: "cs:EasingCurveOut:tooltip"
            String: "The simple curve to use for the animation of the component, played when it enters its hidden state. The animation affects the y axis offset (= key value) and opacity (= key value/max value) of the component."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Scoreboard"
        }
      }
      Objects {
        Id: 12568011602220996725
        Name: "Scores"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2476167449649329883
        ChildIds: 18182316824432393535
        ChildIds: 10689726876477644324
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Scores"
        }
      }
      Objects {
        Id: 18182316824432393535
        Name: "Deaths"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12568011602220996725
        UnregisteredParameters {
          Overrides {
            Name: "cs:UsePlayerResources"
            Bool: false
          }
          Overrides {
            Name: "cs:ValueSource"
            String: "deaths"
          }
          Overrides {
            Name: "cs:IsEnabled"
            Bool: true
          }
          Overrides {
            Name: "cs:UsePlayerResources:tooltip"
            String: "When set to true, the ValueSource property will use player resources. When its false, it will use keys from player objects (for example Player.name when it\'s set to name)."
          }
          Overrides {
            Name: "cs:ValueSource:tooltip"
            String: "The string/key to use to access the value for this score. Check the UsePlayerResources property\'s tooltip for more info."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Deaths"
        }
      }
      Objects {
        Id: 10689726876477644324
        Name: "Kills"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12568011602220996725
        UnregisteredParameters {
          Overrides {
            Name: "cs:UsePlayerResources"
            Bool: false
          }
          Overrides {
            Name: "cs:ValueSource"
            String: "kills"
          }
          Overrides {
            Name: "cs:IsEnabled"
            Bool: true
          }
          Overrides {
            Name: "cs:UsePlayerResources:tooltip"
            String: "When set to true, the ValueSource property will use player resources. When its false, it will use keys from player objects (for example Player.name when it\'s set to name)."
          }
          Overrides {
            Name: "cs:ValueSource:tooltip"
            String: "The string/key to use to access the value for this score. Check the UsePlayerResources property\'s tooltip for more info."
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
          FilePartitionName: "Kills"
        }
      }
    }
    Assets {
      Id: 5129014730210097581
      Name: "Icon Tools"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Tools"
      }
    }
    Assets {
      Id: 9738688525360925377
      Name: "Hammer"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_icon_Hammer"
      }
    }
    Assets {
      Id: 11232416293698382143
      Name: "Icon Achievement"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Medal"
      }
    }
    Assets {
      Id: 6489266249843332418
      Name: "Icon Beaker"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Beaker"
      }
    }
    Assets {
      Id: 6595698929899861519
      Name: "Icon Star"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Star"
      }
    }
    Assets {
      Id: 12643252433729064444
      Name: "Infinity"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_SciFI_Icon_030"
      }
    }
    Assets {
      Id: 3724194992859379954
      Name: "Icon Manticore"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Manticore"
      }
    }
    Assets {
      Id: 5374390865387286219
      Name: "Fantasy Ability Blue 001"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Ability_Blue_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 100
}
