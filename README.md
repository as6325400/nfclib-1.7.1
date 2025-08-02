## Build
```
docker build -t libnfc-1.7.1 .
```

## Test
```
docker run --rm --device=/dev/ttyUSB0 -v "$(pwd)/libnfc.conf:/etc/nfc/libnfc.conf" libnfc-1.7.1
```
