# go-harlog

net/http client logging by HAR format.

Take http request/response log by HAR (HTTP Archive) format.
It can visualize by [any](https://developers.google.com/web/updates/2017/08/devtools-release-notes#har-imports) [tools](https://toolbox.googleapps.com/apps/har_analyzer/).

```shell script
$ go get github.com/vvakame/go-harlog
```

```go
har := &harlog.Transport{}
hc := &http.Client{
    Transport: har,
}

// do something...

b, err := json.MarshalIndent(har.HAR(), "", "  ")
if err != nil {
    return err
}
fmt.Println(string(b))
```

## Limitations

* compressed response is not supported yet.
* `headersSize` is not calculated.

patches welcome!
