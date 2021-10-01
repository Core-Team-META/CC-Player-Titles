Assets {
  Id: 15682209961142067863
  Name: "METAPlayerTitles_Nameplates"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 6452581709241550381
      Objects {
        Id: 6452581709241550381
        Name: "METAPlayerTitles_Nameplates"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10497177608845763861
        ChildIds: 10013921245615962860
        UnregisteredParameters {
          Overrides {
            Name: "cs:Configurator"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:Configurator:tooltip"
            String: "The configurator to use for this component."
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
          FilePartitionName: "METAPlayerTitles_Nameplates"
        }
      }
      Objects {
        Id: 10013921245615962860
        Name: "Client"
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
        ParentId: 6452581709241550381
        ChildIds: 15638111723272112250
        ChildIds: 4714032125025357454
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
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
        NetworkContext {
        }
      }
      Objects {
        Id: 15638111723272112250
        Name: "METAPlayerTitles_NameplatesHandler"
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
        ParentId: 10013921245615962860
        UnregisteredParameters {
          Overrides {
            Name: "cs:RootFolder"
            ObjectReference {
              SubObjectId: 6452581709241550381
            }
          }
          Overrides {
            Name: "cs:NameplatesFolder"
            ObjectReference {
              SubObjectId: 4714032125025357454
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
        Script {
          ScriptAsset {
            Id: 3186596417994655446
          }
        }
      }
      Objects {
        Id: 4714032125025357454
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
        ParentId: 10013921245615962860
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
          FilePartitionName: "Nameplates_1"
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
