# -*- coding: utf-8 -*-

"""
    /// from https://github.com/taurusai/kungfu
    char first_d = ticker[0];
    switch (first_d)
    {
        // common first
        case '6': // 600/601 - A stock
            return EXCHANGE_ID_SSE;
        case '3': // 300 - 创业板
        case '0': // 000 - A stock; 002 - 中小板; 080 - 配股; 031 - 权证
        case '1': //159 ETF
            return EXCHANGE_ID_SZE;
            // exotics
        case '5': // 权证
        case '9': // 900 - B stock
        case '7': // 730 - new stock; 700 - 配股
            return EXCHANGE_ID_SSE;
        case '2': // 200 - B stock
            return EXCHANGE_ID_SZE;
        default:
            return -1;
    }
"""

def get_exchange_id(instrument_id):
    """
        return wind-exchange-id
    """
    if instrument_id[0] in ['6', '5', '9', '7']:
        return ".SH"
    elif instrument_id[0] in ['3', '0', '2']:
        return ".SZ"
    elif instrument_id[0] in ['R', 'A', 'C', 'P', 'H', 'N']:
        return ".SHF"
    elif instrument_id[0] in ['I', 'T']:
        return ".CFE"
    else:
        return ""
