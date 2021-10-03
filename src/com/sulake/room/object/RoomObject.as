package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1073:int = 0;
       
      
      private var var_62:Vector3d;
      
      private var _updateID:int;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var _model:RoomObjectModel;
      
      private var var_394:IRoomObjectEventHandler;
      
      private var var_1476:Vector3d;
      
      private var _instanceId:int = 0;
      
      private var _id:int;
      
      private var var_1477:Vector3d;
      
      private var var_203:Vector3d;
      
      private var var_478:Array;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         _id = param1;
         var_62 = new Vector3d();
         var_203 = new Vector3d();
         var_1476 = new Vector3d();
         var_1477 = new Vector3d();
         var_478 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_478[_loc3_] = 0;
            _loc3_--;
         }
         _model = new RoomObjectModel();
         _visualization = null;
         var_394 = null;
         _updateID = 0;
         _instanceId = var_1073++;
      }
      
      public function getInstanceId() : int
      {
         return _instanceId;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_62 = null;
         var_203 = null;
         if(_model != null)
         {
            _model.dispose();
            _model = null;
         }
         var_478 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1476.assign(var_62);
         return var_1476;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_62.x != param1.x || var_62.y != param1.y || var_62.z != param1.z)
         {
            var_62.x = param1.x;
            var_62.y = param1.y;
            var_62.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_203.x != param1.x || var_203.y != param1.y || var_203.z != param1.z)
         {
            var_203.x = (param1.x % 360 + 360) % 360;
            var_203.y = (param1.y % 360 + 360) % 360;
            var_203.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_394;
      }
      
      public function getDirection() : IVector3d
      {
         var_1477.assign(var_203);
         return var_1477;
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < var_478.length)
         {
            if(var_478[param2] != param1)
            {
               var_478[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_394)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_394;
         if(_loc2_ != null)
         {
            var_394 = null;
            _loc2_.object = null;
         }
         var_394 = param1;
         if(var_394 != null)
         {
            var_394.object = this;
         }
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_478.length)
         {
            return var_478[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return _model;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return _model;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
