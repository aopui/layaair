package laya.webgl.shader.d2.skinAnishader 
{
	import laya.maths.Rectangle;
	import laya.webgl.shader.d2.fillTexture.FillTextureSprite;
	import laya.webgl.WebGL;
	import laya.webgl.WebGLContext;
	import laya.webgl.shapes.BasePoly;
	import laya.webgl.shapes.IShape;
	import laya.webgl.shapes.Line;
	import laya.webgl.shapes.LoopLine;
	import laya.webgl.shapes.Polygon;
	import laya.webgl.utils.CONST3D2D;
	import laya.webgl.utils.IndexBuffer2D;
	import laya.webgl.utils.VertexBuffer2D;
	
	public class SkinMeshBuffer {
		
		public var ib:IndexBuffer2D;
		public var vb:VertexBuffer2D;
		
		public static var instance:SkinMeshBuffer;
		
		public function SkinMeshBuffer() {
			var gl:WebGLContext = WebGL.mainContext;
			ib = IndexBuffer2D.create(WebGLContext.DYNAMIC_DRAW);
			vb = VertexBuffer2D.create(8);
		}
		
		public static function getInstance():SkinMeshBuffer
		{
			return instance ||= new SkinMeshBuffer();
		}
		
		public function addSkinMesh(skinMesh:SkinMesh):void
		{
			skinMesh.getData(vb, ib, vb.byteLength / 32);
		}
		
		public function addFillTexture(fillTexture:FillTextureSprite):void
		{
			fillTexture.getData(vb, ib, vb.byteLength / 32);
		}
		
		
		public function reset():void {
			this.vb.clear();
			this.ib.clear();
		}
	
	}

}