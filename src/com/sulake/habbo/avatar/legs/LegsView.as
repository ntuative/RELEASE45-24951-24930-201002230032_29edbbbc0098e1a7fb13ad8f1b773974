package com.sulake.habbo.avatar.legs
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.avatar.AvatarEditorView;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class LegsView implements IAvatarEditorCategoryView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1422:String;
      
      private var var_479:IWindowContainer;
      
      private var var_297:String = "";
      
      private var _model:LegsModel;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_699:Dictionary;
      
      public function LegsView(param1:LegsModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         _model = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_legs_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         var_699 = new Dictionary();
         var_699["null"] = new AvatarEditorGridView(param1,FigureData.const_132,param2,param3);
         var_699["null"] = new AvatarEditorGridView(param1,FigureData.const_137,param2,param3);
         var_699["null"] = new AvatarEditorGridView(param1,FigureData.const_120,param2,param3);
         attachImages();
         switchCategory(FigureData.const_132);
         _window.visible = false;
         _window.procedure = windowEventProc;
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_pants":
                  switchCategory(FigureData.const_132);
                  break;
               case "tab_shoes":
                  switchCategory(FigureData.const_137);
                  break;
               case "tab_belts":
                  switchCategory(FigureData.const_120);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_11)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  if(var_297 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
      
      private function setElementImage(param1:IBitmapWrapperWindow, param2:Boolean) : void
      {
         var asset:IAsset = null;
         var assetName:String = null;
         var src:BitmapData = null;
         var dx:int = 0;
         var dy:int = 0;
         var bmp:IBitmapWrapperWindow = param1;
         var active:Boolean = param2;
         if(bmp == null)
         {
            return;
         }
         Logger.log("setElementImage: " + bmp.name);
         var result:Array = bmp.properties.filter(function(param1:*, param2:int, param3:Array):Boolean
         {
            return PropertyStruct(param1).key == "bitmap_asset_name";
         });
         if(result.length)
         {
            assetName = PropertyStruct(result[0]).value as String;
            if(active)
            {
               assetName = assetName.replace("_on","");
            }
            asset = _assetLibrary.getAssetByName(assetName);
            if(asset && asset is BitmapDataAsset)
            {
               bmp.bitmap = new BitmapData(bmp.width,bmp.height,false,AvatarEditorView.var_1052);
               src = BitmapDataAsset(asset).content as BitmapData;
               dx = (bmp.width - src.width) / 2;
               dy = (bmp.height - src.height) / 2;
               bmp.bitmap.copyPixels(src,src.rect,new Point(dx,dy));
            }
         }
      }
      
      private function changeToCurrentTab() : void
      {
         var _loc1_:IWindowContainer = _window.findChildByName("grid_container") as IWindowContainer;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.removeChildAt(0);
         var _loc2_:AvatarEditorGridView = var_699[var_1422];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.window;
         if(_loc3_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.addChild(_loc3_);
         _loc1_.invalidate();
         if(_loc2_.firstView)
         {
            _loc2_.initFromList();
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_1422 == param1)
         {
            return;
         }
         var _loc2_:ISelectorWindow = _window.findChildByName("category_selector") as ISelectorWindow;
         inactivateTab(var_297);
         switch(param1)
         {
            case FigureData.const_132:
               var_297 = "tab_pants";
               break;
            case FigureData.const_137:
               var_297 = "tab_shoes";
               break;
            case FigureData.const_120:
               var_297 = "tab_belts";
               break;
            default:
               throw new Error("[LegsView] Unknown item category: \"" + param1 + "\"");
         }
         activateTab(var_297);
         var_1422 = param1;
         _model.categorySwitch(param1);
         changeToCurrentTab();
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         _window.groupChildrenWithTag("bitmap",_loc1_,true);
         for each(_loc2_ in _loc1_)
         {
            setElementImage(_loc2_,false);
         }
      }
      
      private function activateTab(param1:String) : void
      {
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,true);
      }
      
      private function inactivateTab(param1:String) : void
      {
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         setElementImage(_loc2_,false);
      }
      
      public function dispose() : void
      {
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
   }
}
