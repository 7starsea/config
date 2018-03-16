import gzip
import shutil
from io import StringIO
import pandas as pd
import time
import os.path
import binascii


def write_gz_file(raw_filename, gz_filename):
    df = pd.read_csv(raw_filename, index_col=False)
    df.to_csv(gz_filename, index=False, compression='gzip')

write_gz_file('test.csv', 'test2.csv.gz')


def create_gz_file(raw_filename, gz_filename):
    with gzip.open(gz_filename, 'wb', compresslevel=4) as f_out:
        with open(raw_filename, 'rb') as f_in:
            shutil.copyfileobj(f_in, f_out)

if not os.path.isfile('test.csv.gz'):
    create_gz_file('test.csv', 'test.csv.gz')

def is_gz_file(test_gz_filename):
    with open(test_gz_filename, 'rb') as test_f:
        return binascii.hexlify(test_f.read(2)) == b'1f8b'

print('is_gz_file:', is_gz_file('test.csv.gz'))

def compare_read_time(raw_filename, gz_filename, count=200):
    total_raw_time, total_gz_time = 0, 0
    for i in range(count):
        t1 = time.time()
        df = pd.read_csv(raw_filename, index_col=None)
        t2 = time.time()
        total_raw_time += t2 - t1
    for i in range(count):
        t1 = time.time()
        with gzip.open(gz_filename, 'rb', compresslevel=4) as f_in:
            file_content = f_in.read()

            data = StringIO(file_content.decode('utf8'))
            df = pd.read_csv(data, index_col=None)
        t2 = time.time()
        total_gz_time += t2 - t1
    print('RawReadTime: %.3f seconds GzipReadTime: %.3f seconds' % (total_raw_time, total_gz_time))

compare_read_time('test.csv', 'test.csv.gz')




