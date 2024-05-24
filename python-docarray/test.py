from docarray import DocVec
from docarray import BaseDoc
from docarray.typing import TorchTensor, ImageUrl
import torch


class MyDocument(BaseDoc):
    description: str
    image_url: ImageUrl
    image_tensor: TorchTensor[1704, 2272, 3]


doc = MyDocument(
    description="A cat",
    image_url="https://example.com/cat.jpg",
    image_tensor=torch.rand(1704, 2272, 3),
)


vec = DocVec[MyDocument]([doc] * 10)
print(vec.image_tensor.shape)  # (10, 1704, 2272, 3)

json = doc.json()
proto = doc.to_protobuf()

doc_2 = MyDocument.parse_raw(json)
doc_3 = MyDocument.from_protobuf(proto)
print(doc_3)
