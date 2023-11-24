from channels.generic.websocket import AsyncWebsocketConsumer
from channels.exceptions import StopConsumer


class ChatConsumer(AsyncWebsocketConsumer):
    async def websocket_connect(self, message):
        # 有客户端向后端改善websocket请求时自动触发
        # 服务端允许执行下行代码，如果不允许可以用 raise StopConsumner()拒绝客户端的连接请求

        # 加组
        await self.channel_layer.group_add('111', self.channel_name)

        await self.accept()

    async def websocket_receive(self, message):
        # 客户端发来数据时触发，message是客户端发来的数据（一个字典）
        await self.send(message['text'])  # 向客户端发送数据

    async def websocket_disconnect(self, message):
        # 断开连接时触发
        raise StopConsumer()
