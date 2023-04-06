HTTP headers can be classified into four types:

HTTP Request Header
Whenever you type a URL into the address bar and try to access it, your browser sends an HTTP request to the server. The HTTP request header contains information in a text-record form, which includes particulars such as the:

Type, capabilities and version of the browser that generates the request.
Operating system used by the client.
Page that was requested.
Various types of outputs accepted by the browser.
HTTP Response Header
Upon receiving the request header, the Web server will send an HTTP response header back to the client. An HTTP response header includes information in a text-record form that a Web server transmits back to the client's browser. The response header contains particulars such as the type, date and size of the file sent back by the server, as well as information regarding the server.

HTTP General Header
These headers contain directives that need to be followed, for both the requester and receiver. This can include information regarding:

Caching directives.
Specified connection options.
The date (always listed in Greenwich Mean TIme)
Pragma
Upgrade (for if the protocols need to be switched)
Via (to indicate intermediate protocols)
Warning (for additional information not found elsewhere in the header. There may be more than one warning listed.)
HTTP Entity Header
These headers include information regarding:

Allow (methods supported by the identified resource)
Content Encoding.
Content Language.
Content Location.
Content Length.
MD-5 (for checking the integrity of the message upon receipt).
Content Range.
Content Type.
When it Expires.
When it was last modified.
