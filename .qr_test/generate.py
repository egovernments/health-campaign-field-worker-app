#!/usr/bin/env python3
"""Regenerate the deep-link test QR. Change tenant_id / header below.

Usage:
    python3 .qr_test/generate.py
"""
import qrcode
from urllib.parse import urlencode

tenant_id = "demo-tenant"
header = "Demo Health Campaign"

url = "hcm://open?" + urlencode({"tenantId": tenant_id, "header": header})
qrcode.make(url, box_size=10, border=4).save(".qr_test/deep_link.png")
print("QR encodes:", url)
print("saved: .qr_test/deep_link.png")
