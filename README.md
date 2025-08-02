## Build
```
docker build -t libnfc-1.7.1 .
```

## Test
```
docker run --rm --device=/dev/ttyUSB0 -v "$(pwd)/libnfc.conf:/etc/nfc/libnfc.conf" libnfc-1.7.1
```

## Dump src card
```
docker run --rm --device=/dev/ttyUSB0 -v "$(pwd):/data" -v "$(pwd)/libnfc.conf:/etc/nfc/libnfc.conf" libnfc-1.7.1 nfc-mfclassic r a /data/dump.mfd
```

## Write target card
```
docker run --rm --device=/dev/ttyUSB0 -v "$(pwd):/data" -v "$(pwd)/libnfc.conf:/etc/nfc/libnfc.conf" libnfc-1.7.1 nfc-mfclassic W a /data/dump.mfd
```

## Dump src card
```
docker run --rm --device=/dev/ttyUSB0 -v "$(pwd):/data" -v "$(pwd)/libnfc.conf:/etc/nfc/libnfc.conf" libnfc-1.7.1 nfc-mfclassic r a /data/verify.mfd
```

## Validate
```
diff dump.mfd verify.mfd
```
