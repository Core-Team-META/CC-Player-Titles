Assets {
  Id: 868964529713494123
  Name: "METAPlayerTitles_ConfiguratorScore"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 11625892347937029529
      Objects {
        Id: 11625892347937029529
        Name: "METAPlayerTitles_ConfiguratorScore"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12385130140791979254
        UnregisteredParameters {
          Overrides {
            Name: "cs:UsePlayerResources"
            Bool: true
          }
          Overrides {
            Name: "cs:ValueSource"
            String: ""
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
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 100
}
