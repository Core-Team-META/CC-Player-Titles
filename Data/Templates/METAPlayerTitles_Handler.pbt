Assets {
  Id: 16302603277956090916
  Name: "METAPlayerTitles_Handler"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 3919527880117986418
      Objects {
        Id: 3919527880117986418
        Name: "METAPlayerTitles_Handler"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10497177608845763861
        ChildIds: 7142583767537185158
        ChildIds: 1527551482373695837
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
          FilePartitionName: "METAPlayerTitles_Handler"
        }
      }
      Objects {
        Id: 7142583767537185158
        Name: "METAPlayerTitles_Handler"
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
        ParentId: 3919527880117986418
        UnregisteredParameters {
          Overrides {
            Name: "cs:RootFolder"
            ObjectReference {
              SubObjectId: 3919527880117986418
            }
          }
          Overrides {
            Name: "cs:PlayerDataFolder"
            ObjectReference {
              SubObjectId: 12447878320999495226
            }
          }
          Overrides {
            Name: "cs:TitleDataFolder"
            ObjectReference {
              SubObjectId: 1864424743989800818
            }
          }
        }
        WantsNetworking: true
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
            Id: 2308916199539966739
          }
        }
      }
      Objects {
        Id: 1527551482373695837
        Name: "Session Data"
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
        ParentId: 3919527880117986418
        ChildIds: 12447878320999495226
        ChildIds: 1864424743989800818
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
          FilePartitionName: "Session Data"
        }
      }
      Objects {
        Id: 12447878320999495226
        Name: "Player Data"
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
        ParentId: 1527551482373695837
        WantsNetworking: true
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
          FilePartitionName: "Player Data"
        }
      }
      Objects {
        Id: 1864424743989800818
        Name: "Title Data"
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
        ParentId: 1527551482373695837
        WantsNetworking: true
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
          FilePartitionName: "Title Data"
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
