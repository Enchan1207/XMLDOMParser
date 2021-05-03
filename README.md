# XMLDOMParser

![lang:Swift](https://img.shields.io/badge/language-Swift-FA7343) 

## Overview

DOM-type XML parser.

## Usage

```swift

let XMLString = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="net.enchan-lab.StoryboardAnalyserEx.sample.xml" version="3.0">
    プレーンテキストです。
    <elem id="" class="">
        要素内のテキストです。
        <p id="">
            <b>
                タグと要素が混合した
            </b>
            テキストです。
        </p>
    </elem>
</document>
"""
let parser = XMLDOMParser(data: XMLString.data(using: .utf8)!)

parser.parse { (node) in
    print(node)
} failure: { (error) in
    print(error)
} 
```

## License

This repository is published under MIT License.
In details, see [LICENSE](LICENSE).
